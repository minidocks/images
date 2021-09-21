#!/bin/sh
set -e

. /bin/file_env

esceval() {
  printf "%s" "$@" | sed "s/'/'\"'\"'/g"
}

# Copy from https://github.com/docker-library/postgres/blob/master/12/alpine/docker-entrypoint.sh

# used to create initial postgres directories and if run as root, ensure ownership to the "postgres" user
docker_create_db_directories() {
  local user="$(id -u)"
  mkdir -p "$PGDATA"
  chmod 700 "$PGDATA"

  # ignore failure since it will be fine when using the image provided directory; see also https://github.com/docker-library/postgres/pull/289
  mkdir -p /var/run/postgresql || :
  chmod 775 /var/run/postgresql || :

  # Create the transaction log directory before initdb is run so the directory is owned by the correct user
  if [ -n "$POSTGRES_INITDB_WALDIR" ]; then
    mkdir -p "$POSTGRES_INITDB_WALDIR"
    if [ "$user" = '0' ]; then
      find "$POSTGRES_INITDB_WALDIR" \! -user postgres -exec chown postgres '{}' +
    fi
    chmod 700 "$POSTGRES_INITDB_WALDIR"
  fi

  # allow the container to be started with `--user`
  if [ "$user" = '0' ]; then
    find "$PGDATA" \! -user postgres -exec chown postgres '{}' +
    find /var/run/postgresql \! -user postgres -exec chown postgres '{}' +
  fi
}

# initialize empty PGDATA directory with new database via 'initdb'
# arguments to `initdb` can be passed via POSTGRES_INITDB_ARGS or as arguments to this function
# `initdb` automatically creates the "postgres", "template0", and "template1" dbnames
# this is also where the database user is created, specified by `POSTGRES_USER` env
docker_init_database_dir() {
  if [ -n "$POSTGRES_INITDB_WALDIR" ]; then
    set -- --waldir "$POSTGRES_INITDB_WALDIR" "$@"
  fi

  echo "$POSTGRES_PASSWORD" > /tmp/postgres_password && chmod a+r /tmp/postgres_password
  initdb --username="postgres" --pwfile=/tmp/postgres_password $POSTGRES_INITDB_ARGS "$@"
  rm /tmp/postgres_password
}

# print large warning if POSTGRES_PASSWORD is long
# error if both POSTGRES_PASSWORD is empty and POSTGRES_HOST_AUTH_METHOD is not 'trust'
# print large warning if POSTGRES_HOST_AUTH_METHOD is set to 'trust'
# assumes database is not set up, ie: [ -z "$DATABASE_ALREADY_EXISTS" ]
docker_verify_minimum_env() {
  # check password first so we can output the warning before postgres
  # messes it up
  if [ "${#POSTGRES_PASSWORD}" -ge 100 ]; then
    cat >&2 <<'EOWARN'
WARNING: The supplied POSTGRES_PASSWORD is 100+ characters.
         This will not work if used via PGPASSWORD with "psql".
         https://www.postgresql.org/message-id/flat/E1Rqxp2-0004Qt-PL%40wrigleys.postgresql.org (BUG #6412)
         https://github.com/docker-library/postgres/issues/507
EOWARN
  fi
  if [ -z "$POSTGRES_PASSWORD" ] && [ 'trust' != "$POSTGRES_HOST_AUTH_METHOD" ]; then
    # The - option suppresses leading tabs but *not* spaces. :)
    cat >&2 <<'EOE'
Error: Database is uninitialized and superuser password is not specified.
       You must specify POSTGRES_PASSWORD to a non-empty value for the
       superuser. For example, "-e POSTGRES_PASSWORD=password" on "docker run".
       You may also use "POSTGRES_HOST_AUTH_METHOD=trust" to allow all
       connections without a password. This is *not* recommended.
       See PostgreSQL documentation about "trust":
       https://www.postgresql.org/docs/current/auth-trust.html
EOE
    exit 1
  fi
  if [ 'trust' = "$POSTGRES_HOST_AUTH_METHOD" ]; then
    cat >&2 <<'EOWARN'
********************************************************************************
WARNING: POSTGRES_HOST_AUTH_METHOD has been set to "trust". This will allow
         anyone with access to the Postgres port to access your database without
         a password, even if POSTGRES_PASSWORD is set. See PostgreSQL
         documentation about "trust":
         https://www.postgresql.org/docs/current/auth-trust.html
         In Docker's default configuration, this is effectively any other
         container on the same system.
         It is not recommended to use POSTGRES_HOST_AUTH_METHOD=trust. Replace
         it with "-e POSTGRES_PASSWORD=password" instead to set a password in
         "docker run".
********************************************************************************
EOWARN
  fi
}

# usage: docker_process_init_files [file [file [...]]]
#    ie: docker_process_init_files /always-initdb.d/*
# process initializer files, based on file extensions and permissions
docker_process_init_files() {
  # psql here for backwards compatibility "${psql[@]}"
  # psql=( docker_process_sql )

  echo
  local f
  for f; do
    case "$f" in
      *.sh)
        # https://github.com/docker-library/postgres/issues/450#issuecomment-393167936
        # https://github.com/docker-library/postgres/pull/452
        if [ -x "$f" ]; then
          echo "$0: running $f"
          "$f"
        else
          echo "$0: sourcing $f"
          . "$f"
        fi
        ;;
      *.sql)    echo "$0: running $f"; docker_process_sql -f "$f"; echo ;;
      *.sql.gz) echo "$0: running $f"; gunzip -c "$f" | docker_process_sql; echo ;;
      *.sql.xz) echo "$0: running $f"; xzcat "$f" | docker_process_sql; echo ;;
      *)        echo "$0: ignoring $f" ;;
    esac
    echo
  done
}

# Execute sql script, passed via stdin (or -f flag of pqsl)
# usage: docker_process_sql [psql-cli-args]
#    ie: docker_process_sql --dbname=mydb <<<'INSERT ...'
#    ie: docker_process_sql -f my-file.sql
#    ie: docker_process_sql <my-file.sql
docker_process_sql() {
  local query_runner="psql -v ON_ERROR_STOP=1 --username postgres --no-password"
  if [ -n "$POSTGRES_DB" ]; then
    query_runner="$query_runner --dbname $(esceval "$POSTGRES_DB")"
  fi

  $query_runner "$@"
}

# create initial database
# uses environment variables for input: POSTGRES_DB
docker_setup_db() {
  local dbAlreadyExists="$(docker_process_sql --dbname postgres --set db="$(esceval "$POSTGRES_DB")" --tuples-only <<EOSQL
SELECT 1 FROM pg_database WHERE datname = :'db';
EOSQL
  )"

  if [ -z "$dbAlreadyExists" ] && [ "$POSTGRES_DB" != 'postgres' ]; then
    docker_process_sql --dbname postgres --set db="$(esceval "$POSTGRES_DB")" <<EOSQL
CREATE DATABASE :"db";
EOSQL
    echo
  fi
}

docker_setup_user() {
  if [ "$POSTGRES_USER" != 'postgres' ]; then
    local SQL='CREATE USER :"user" WITH SUPERUSER'
    if [ -n "$POSTGRES_PASSWORD" ]; then
      SQL="$SQL PASSWORD :'pass'"
    fi
    docker_process_sql --dbname postgres --set user="$(esceval "$POSTGRES_USER")" --set pass="$(esceval "$POSTGRES_PASSWORD")" <<EOSQL
${SQL};
EOSQL
    echo
  fi
}

# Loads various settings that are used elsewhere in the script
# This should be called before any other functions
docker_setup_env() {
  # one line url configuration
  file_env 'DATABASE_URL'
  file_env 'POSTGRES_URL'

  file_env 'POSTGRES_PASSWORD' "$(parse_url "${POSTGRES_URL:-$DATABASE_URL}" pass)"

  file_env 'POSTGRES_USER' "$(parse_url "${POSTGRES_URL:-$DATABASE_URL}" user)" "postgres"
  file_env 'POSTGRES_DB' "$(parse_url "${POSTGRES_URL:-$DATABASE_URL}" path)" "$POSTGRES_USER"

  file_env 'POSTGRES_INITDB_ARGS'
  # default authentication method is md5
  : "${POSTGRES_HOST_AUTH_METHOD:=md5}"

  # look specifically for PG_VERSION, as it is expected in the DB dir
  if [ -s "$PGDATA/PG_VERSION" ]; then
    export DATABASE_ALREADY_EXISTS='true'
  fi
}

# append POSTGRES_HOST_AUTH_METHOD to pg_hba.conf for "host" connections
pg_setup_hba_conf() {
  {
    echo
    if [ 'trust' = "$POSTGRES_HOST_AUTH_METHOD" ]; then
      echo '# warning trust is enabled for all connections'
      echo '# see https://www.postgresql.org/docs/12/auth-trust.html'
    fi
    echo "host all all all $POSTGRES_HOST_AUTH_METHOD"
  } >> "$PGDATA/pg_hba.conf"
}

pg_setup_postgresql_conf() {
  if [ "${POSTGRES_RUNTIME_CONF:-1}" != '1' ]; then
      return
  fi

  echo 'PostgreSQL runtime configuration.'

  conf_env POSTGRES_ --pattern='!/^POSTGRES_(URL|USER|PASSWORD|DATABASE|DB|HOST_AUTH_METHOD|INITDB_ARGS|INITDB_WALDIR|RUNTIME_CONF)$/' --file="$PGDATA/postgresql.conf"
}

# start socket-only postgresql server for setting up or running scripts
# all arguments will be passed along as arguments to `postgres` (via pg_ctl)
docker_temp_server_start() {
  if [ "$1" = 'postgres' ]; then
    shift
  fi

  # internal start of server in order to allow setup using psql client
  # does not listen on external TCP/IP and waits until start finishes
  set -- "$@" -c listen_addresses='' -p "${PGPORT:-5432}"

  PGUSER="${PGUSER:-$POSTGRES_USER}" \
  pg_ctl -D "$PGDATA" -o "$(printf "%s " "$@" | sed "s/'/'\"'\"'/g")" -w start
}

# stop postgresql server after done setting up user and running scripts
docker_temp_server_stop() {
  PGUSER="${PGUSER:-postgres}" \
  pg_ctl -D "$PGDATA" -m fast -w stop
}

# check arguments for an option that would cause postgres to stop
# return true if there is one
_pg_want_help() {
  local arg
  for arg; do
    case "$arg" in
      # postgres --help | grep 'then exit'
      # leaving out -C on purpose since it always fails and is unhelpful:
      # postgres: could not access the server configuration file "/var/lib/postgresql/data/postgresql.conf": No such file or directory
      -'?'|--help|--describe-config|-V|--version)
        return 0
        ;;
    esac
  done
  return 1
}

_main() {
  # if first arg looks like a flag, assume we want to run postgres server
  if [ "${1:0:1}" = '-' ]; then
    set -- postgres "$@"
  fi

  if [ "$1" = 'postgres' ] && ! _pg_want_help "$@"; then
    docker_setup_env
    # setup data directories and permissions (when run as root)
    docker_create_db_directories
    if [ "$(id -u)" = '0' ]; then
      # restart script as postgres user
      su-exec postgres /docker-entrypoint.d/postgres.sh "$@"
      USER_NAME="postgres" GROUP_NAME="postgres" USER_ID="$(id -u postgres)" GROUP_ID="$(getent group postgres | awk -F: '{print $3}')"
      export USER_NAME GROUP_NAME USER_ID GROUP_ID
      return
    else
      # only run initialization on an empty data directory
      if [ -z "$DATABASE_ALREADY_EXISTS" ]; then
        docker_verify_minimum_env

        # check dir permissions to reduce likelihood of half-initialized database
        ls /docker-entrypoint-initdb.d/ > /dev/null

        docker_init_database_dir
        pg_setup_hba_conf

        # PGPASSWORD is required for psql when authentication is required for 'local' connections via pg_hba.conf and is otherwise harmless
        # e.g. when '--auth=md5' or '--auth-local=md5' is used in POSTGRES_INITDB_ARGS
        export PGPASSWORD="${PGPASSWORD:-$POSTGRES_PASSWORD}"
        docker_temp_server_start "$@"

        docker_setup_db
        docker_setup_user
        docker_process_init_files /docker-entrypoint-initdb.d/*

        docker_temp_server_stop
        unset PGPASSWORD

        echo
        echo 'PostgreSQL init process complete; ready for start up.'
        echo
      else
        echo
        echo 'PostgreSQL Database directory appears to contain a database; Skipping initialization'
        echo
      fi
    fi
  fi

  pg_setup_postgresql_conf
}

_main "$@"
