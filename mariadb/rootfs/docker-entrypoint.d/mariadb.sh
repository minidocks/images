#!/bin/sh

# Based on https://github.com/MariaDB/mariadb-docker/blob/master/10.6/docker-entrypoint.sh

set -e

. /bin/file_env
. /bin/conf_env

_mariadb_file_env() {
    local var="$1"; shift
    local maria="MARIADB_${var#MYSQL_}"
    file_env "$var" "$@"
    file_env "$maria" "$(eval echo "\${$var}")"
    if [ "$(eval echo "\${$maria}")" ]; then
        export "$var"="$(eval echo "\${$maria}")"
    fi
}

# usage: docker_process_init_files [file [file [...]]]
#    ie: docker_process_init_files /always-initdb.d/*
# process initializer files, based on file extensions
docker_process_init_files() {
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
                    # ShellCheck can't follow non-constant source. Use a directive to specify location.
                    # shellcheck disable=SC1090
                    . "$f"
                fi
                ;;
            *.sql)     echo "$0: running $f"; docker_process_sql < "$f"; echo ;;
            *.sql.gz)  echo "$0: running $f"; gunzip -c "$f" | docker_process_sql; echo ;;
            *.sql.xz)  echo "$0: running $f"; xzcat "$f" | docker_process_sql; echo ;;
            *.sql.zst) echo "$0: running $f"; zstd -dc "$f" | docker_process_sql; echo ;;
            *)         echo "$0: ignoring $f" ;;
        esac
        echo
    done
}

# arguments necessary to run "mariadbd --verbose --help" successfully (used for testing configuration validity and for extracting default/configured values)
_verboseHelpArgs() {
    echo --verbose --help --log-bin-index="$(mktemp -u)" # https://github.com/docker-library/mysql/issues/136
}

mysql_check_config() {
    local toRun="$@ $(_verboseHelpArgs)", errors
    if ! errors="$($toRun 2>&1 >/dev/null)"; then
      echo $'mariadbd failed while attempting to check config\n\tcommand was: '"$toRun"$'\n\t'"$errors" >&2
      exit 1
    fi
}

# Fetch value from server config
# We use mariadbd --verbose --help instead of my_print_defaults because the
# latter only show values present in config files, and not server defaults
mysql_get_config() {
    local conf="$1"; shift
    "$@" $(_verboseHelpArgs) 2>/dev/null | awk -v conf="$conf" '$1 == conf && /^[^ \t]/ { sub(/^[^ \t]+[ \t]+/, ""); print; exit }'
    # match "datadir      /some/path with/spaces in/it here" but not "--xyz=abc\n     datadir (xyz)"
}

# Do a temporary startup of the MariaDB server, for init purposes
docker_temp_server_start() {
    "$@" --skip-networking --default-time-zone=SYSTEM --socket="${SOCKET}" --wsrep_on=OFF --loose-innodb_buffer_pool_load_at_startup=0 &
    export MARIADB_PID=$!
    echo "Waiting for server startup"
    # only use the root password if the database has already been initializaed
    # so that it won't try to fill in a password file when it hasn't been set yet
    extraArgs=""
    if [ -z "$DATABASE_ALREADY_EXISTS" ]; then
        extraArgs="$extraArgs --dont-use-mysql-root-password"
    fi
    local i
    for i in {30..0}; do
        if echo 'SELECT 1' | docker_process_sql $extraArgs --database=mysql &> /dev/null; then
            break
        fi
        sleep 1
    done
    if [ "$i" = 0 ]; then
        echo "Unable to start server." >&2
        exit 1
    fi
}

# Stop the server. When using a local socket file mariadb-admin will block until
# the shutdown is complete.
docker_temp_server_stop() {
    if ! MYSQL_PWD=$MARIADB_ROOT_PASSWORD mariadb-admin shutdown -uroot --socket="${SOCKET}"; then
        echo "Unable to shut down server." >&2
        exit 1
    fi
}

# Verify that the minimally required password settings are set for new databases.
docker_verify_minimum_env() {
  if [ -z "$MARIADB_ROOT_PASSWORD" ] && [ -z "$MARIADB_ALLOW_EMPTY_ROOT_PASSWORD" ] && [ -z "$MARIADB_RANDOM_ROOT_PASSWORD" ]; then
      echo $'Database is uninitialized and password option is not specified\n\tYou need to specify one of MARIADB_ROOT_PASSWORD, MARIADB_ALLOW_EMPTY_ROOT_PASSWORD and MARIADB_RANDOM_ROOT_PASSWORD' >&2
      exit 1
  fi
}

# creates folders for the database
# also ensures permission for user mysql of run as root
docker_create_db_directories() {
    local user; user="$(id -u)"

    # TODO other directories that are used by default? like /var/lib/mysql-files
    # see https://github.com/docker-library/mysql/issues/562
    mkdir -p "$DATADIR"

    if [ "$user" = "0" ]; then
        # this will cause less disk access than `chown -R`
        find "$DATADIR" \! -user mysql -exec chown mysql: '{}' +
        # See https://github.com/MariaDB/mariadb-docker/issues/363
        find "${SOCKET%/*}" -maxdepth 0 \! -user mysql -exec chown mysql: '{}' \;
    fi
}

_mariadb_version() {
    mariadbd --version | sed -E 's/[-+].+$//;s/^.+ //'
}

# initializes the database directory
docker_init_database_dir() {
  echo "Initializing database files"
  installArgs="--datadir=$DATADIR --rpm --auth-root-authentication-method=normal"
  if { mariadb-install-db --help || :; } | grep -q -- '--skip-test-db'; then
      # 10.3+
      installArgs="$installArgs --skip-test-db"
  else
      # 10.2 only
      installArgs="$installArgs --skip-auth-anonymous-user"
  fi
  # "Other options are passed to mariadbd." (so we pass all "mysqld" arguments directly here)
  shift
  mariadb-install-db $installArgs "$@" \
    --default-time-zone=SYSTEM --enforce-storage-engine= --skip-log-bin \
    --loose-innodb_buffer_pool_load_at_startup=0 \
    --loose-innodb_buffer_pool_dump_at_shutdown=0
  echo "Database files initialized"
}

# Loads various settings that are used elsewhere in the script
# This should be called after mysql_check_config, but before any other functions
docker_setup_env() {
    # Get config
    export DATADIR
    export SOCKET
    DATADIR="$(mysql_get_config 'datadir' "$@")"
    SOCKET="$(mysql_get_config 'socket' "$@")"

    # Initialize values that might be stored in a file
    file_env 'DATABASE_URL'
    _mariadb_file_env 'MYSQL_URL'
    _mariadb_file_env 'MYSQL_ROOT_HOST' '%'
    _mariadb_file_env 'MYSQL_DATABASE' "$(parse_url "${MARIADB_URL:-$DATABASE_URL}" path)"
    _mariadb_file_env 'MYSQL_USER' "$(parse_url "${MARIADB_URL:-$DATABASE_URL}" user)"
    _mariadb_file_env 'MYSQL_PASSWORD' "$(parse_url "${MARIADB_URL:-$DATABASE_URL}" pass)"
    _mariadb_file_env 'MYSQL_ROOT_PASSWORD'

    # set MARIADB_ from MYSQL_ when it is unset and then make them the same value
    : "${MARIADB_ALLOW_EMPTY_ROOT_PASSWORD:=${MYSQL_ALLOW_EMPTY_PASSWORD:-}}"
    export MYSQL_ALLOW_EMPTY_PASSWORD="$MARIADB_ALLOW_EMPTY_ROOT_PASSWORD" MARIADB_ALLOW_EMPTY_ROOT_PASSWORD
    : "${MARIADB_RANDOM_ROOT_PASSWORD:=${MYSQL_RANDOM_ROOT_PASSWORD:-}}"
    export MYSQL_RANDOM_ROOT_PASSWORD="$MARIADB_RANDOM_ROOT_PASSWORD" MARIADB_RANDOM_ROOT_PASSWORD
    : "${MARIADB_INITDB_SKIP_TZINFO:=${MYSQL_INITDB_SKIP_TZINFO:-}}"
    export MYSQL_INITDB_SKIP_TZINFO="$MARIADB_INITDB_SKIP_TZINFO" MARIADB_INITDB_SKIP_TZINFO

    export DATABASE_ALREADY_EXISTS
    if [ -d "$DATADIR/mysql" ]; then
        DATABASE_ALREADY_EXISTS='true'
    fi
}

# Execute the client, use via docker_process_sql to handle root password
docker_exec_client() {
    # args sent in can override this db, since they will be later in the command
    if [ -n "$MYSQL_DATABASE" ]; then
        set -- --database="$MYSQL_DATABASE" "$@"
    fi
    mariadb --protocol=socket -uroot -hlocalhost --socket="${SOCKET}" "$@"
}

# Execute sql script, passed via stdin
# usage: docker_process_sql [--dont-use-mysql-root-password] [mysql-cli-args]
#    ie: echo 'INSERT ...' | docker_process_sql --database=mydb
#    ie: docker_process_sql --dont-use-mysql-root-password --database=mydb <my-file.sql
docker_process_sql() {
    if [ '--dont-use-mysql-root-password' = "$1" ]; then
      shift
        MYSQL_PWD='' docker_exec_client "$@"
    else
        MYSQL_PWD=$MARIADB_ROOT_PASSWORD docker_exec_client "$@"
    fi
}

# SQL escape the string $1 to be placed in a string literal.
# escape, \ followed by '
docker_sql_escape_string_literal() {
    local newline=$'\n'
    local escaped=${1//\\/\\\\}
    escaped="${escaped//$newline/\\n}"
    echo "${escaped//\'/\\\'}"
}

# Initializes database with timezone info and root password, plus optional extra db/user
docker_setup_db() {
    # Load timezone info into database
    if [ -z "$MARIADB_INITDB_SKIP_TZINFO" ]; then
        {
            # MDEV-28189 Replicating the tzinfo is a slow.
            # Its quicker if replicas just initialize the same way.
            echo "SELECT @@SQL_LOG_BIN INTO @save_sql_log_bin;
              SET SESSION SQL_LOG_BIN=0;"

            # --skip-write-binlog here is only if Galera is detected
            # but usefully outputs LOCK TABLES to improve the IO of
            # Aria (MDEV-23326).
            mariadb-tzinfo-to-sql --skip-write-binlog /usr/share/zoneinfo

            echo "SET SESSION SQL_LOG_BIN=@save_sql_log_bin;"
        } | docker_process_sql --dont-use-mysql-root-password --database=mysql
        # tell docker_process_sql to not use MYSQL_ROOT_PASSWORD since it is not set yet
    fi
    # Generate random root password
    if [ -n "$MARIADB_RANDOM_ROOT_PASSWORD" ]; then
        MARIADB_ROOT_PASSWORD="$(pwgen --numerals --capitalize --symbols --remove-chars="'\\" -1 32)"
        export MARIADB_ROOT_PASSWORD MYSQL_ROOT_PASSWORD=$MARIADB_ROOT_PASSWORD
        echo "GENERATED ROOT PASSWORD: $MARIADB_ROOT_PASSWORD"
    fi
    # Sets root password and creates root users for non-localhost hosts
    local rootCreate=
    local rootPasswordEscaped
    rootPasswordEscaped=$( docker_sql_escape_string_literal "${MARIADB_ROOT_PASSWORD}" )

    # default root to listen for connections from anywhere
    if [ -n "$MARIADB_ROOT_HOST" ] && [ "$MARIADB_ROOT_HOST" != 'localhost' ]; then
        # no, we don't care if read finds a terminating character in this heredoc
        # https://unix.stackexchange.com/questions/265149/why-is-set-o-errexit-breaking-this-read-heredoc-expression/265151#265151
        rootCreate="
            CREATE USER 'root'@'${MARIADB_ROOT_HOST}' IDENTIFIED BY '${rootPasswordEscaped}' ;
            GRANT ALL ON *.* TO 'root'@'${MARIADB_ROOT_HOST}' WITH GRANT OPTION ;
        "
    fi

    local mysqlAtLocalhost=
    local mysqlAtLocalhostGrants=
    # Install mysql@localhost user
    if [ -n "$MARIADB_MYSQL_LOCALHOST_USER" ]; then
        local pw=
        pw="$(pwgen --numerals --capitalize --symbols --remove-chars="'\\" -1 32)"
        # MDEV-24111 before MariaDB-10.4 cannot create unix_socket user directly auth with simple_password_check
        # It wasn't until 10.4 that the unix_socket auth was built in to the server.
        mysqlAtLocalhost="
            EXECUTE IMMEDIATE IF(VERSION() RLIKE '^10\.[23]\.',
              \"INSTALL PLUGIN /*M10401 IF NOT EXISTS */ unix_socket SONAME 'auth_socket'\",
              \"SELECT 'already there'\");
            CREATE USER mysql@localhost IDENTIFIED BY '$pw';
            ALTER USER mysql@localhost IDENTIFIED VIA unix_socket;
        "
        if [ -n "$MARIADB_MYSQL_LOCALHOST_GRANTS" ]; then
            if [ "$MARIADB_MYSQL_LOCALHOST_GRANTS" != USAGE ]; then
                echo "Excessive privileges ON *.* TO mysql@localhost facilitates risks to the confidentiality, integrity and availability of data stored" >&2
            fi
            mysqlAtLocalhostGrants="GRANT ${MARIADB_MYSQL_LOCALHOST_GRANTS} ON *.* TO mysql@localhost;";
        fi
    fi

    echo "Securing system users (equivalent to running mysql_secure_installation)"
    # tell docker_process_sql to not use MARIADB_ROOT_PASSWORD since it is just now being set
    # --binary-mode to save us from the semi-mad users go out of their way to confuse the encoding.
    echo "
        -- What's done in this file shouldn't be replicated
        --  or products like mysql-fabric won't work
        SET @@SESSION.SQL_LOG_BIN=0;
                    -- we need the SQL_MODE NO_BACKSLASH_ESCAPES mode to be clear for the password to be set
        SET @@SESSION.SQL_MODE=REPLACE(@@SESSION.SQL_MODE, 'NO_BACKSLASH_ESCAPES', '');
        DROP USER IF EXISTS root@'127.0.0.1', root@'::1';
        EXECUTE IMMEDIATE CONCAT('DROP USER IF EXISTS root@\'', @@hostname,'\'');
        SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${rootPasswordEscaped}') ;
        ${rootCreate}
        ${mysqlAtLocalhost}
        ${mysqlAtLocalhostGrants}
        -- pre-10.3
        DROP DATABASE IF EXISTS test ;
    " | docker_process_sql --dont-use-mysql-root-password --database=mysql --binary-mode

    # Creates a custom database and user if specified
    if [ -n "$MARIADB_DATABASE" ]; then
        echo "Creating database ${MARIADB_DATABASE}"
        echo "CREATE DATABASE IF NOT EXISTS \`$MARIADB_DATABASE\` ;" | docker_process_sql --database=mysql
    fi

    if [ -n "$MARIADB_USER" ] && [ -n "$MARIADB_PASSWORD" ]; then
        echo "Creating user ${MARIADB_USER}"
        # SQL escape the user password, \ followed by '
        local userPasswordEscaped
        userPasswordEscaped=$( docker_sql_escape_string_literal "${MARIADB_PASSWORD}" )
        echo "
            SET @@SESSION.SQL_MODE=REPLACE(@@SESSION.SQL_MODE, 'NO_BACKSLASH_ESCAPES', '');
            CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$userPasswordEscaped';
        " | docker_process_sql --database=mysql --binary-mode

        if [ -n "$MARIADB_DATABASE" ]; then
            echo "Giving user ${MARIADB_USER} access to schema ${MARIADB_DATABASE}"
            echo "GRANT ALL ON \`${MARIADB_DATABASE//_/\\_}\`.* TO '$MARIADB_USER'@'%' ;" | docker_process_sql --database=mysql
        fi
    fi
}

# backup the mysql database
docker_mariadb_backup_system()
{
    if [ -n "$MARIADB_DISABLE_UPGRADE_BACKUP" ] && [ "$MARIADB_DISABLE_UPGRADE_BACKUP" = 1 ]; then
        echo "MariaDB upgrade backup disabled due to \$MARIADB_DISABLE_UPGRADE_BACKUP=1 setting"
        return
    fi
    local backup_db="system_mysql_backup_unknown_version.sql.zst"
    local oldfullversion="unknown_version"
    if [ -r "$DATADIR"/mysql_upgrade_info ]; then
        oldfullversion="$(cat "$DATADIR"/mysql_upgrade_info)"
        if [ -n "$oldfullversion" ]; then
            backup_db="system_mysql_backup_${oldfullversion}.sql.zst"
        fi
    fi

    echo "Backing up system database to $backup_db"
    if ! mariadb-dump --skip-lock-tables --replace --databases mysql --socket="${SOCKET}" | zstd > "${DATADIR}/${backup_db}"; then
      echo "Unable backup system database for upgrade from $oldfullversion." >&2
      exit 1
    fi
    echo "Backing up complete"
}

# perform mariadb-upgrade
# backup the mysql database if this is a major upgrade
docker_mariadb_upgrade() {
    if [ -z "$MARIADB_AUTO_UPGRADE" ] || [ "$MARIADB_AUTO_UPGRADE" = 0 ]; then
        echo "MariaDB upgrade (mariadb-upgrade) required, but skipped due to \$MARIADB_AUTO_UPGRADE setting"
        return
    fi
    echo "Starting temporary server"
    docker_temp_server_start "$@" --skip-grant-tables \
      --loose-innodb_buffer_pool_dump_at_shutdown=0 \
      --skip-slave-start
    echo "Temporary server started."

    docker_mariadb_backup_system

    echo "Starting mariadb-upgrade"
    mariadb-upgrade --upgrade-system-tables
    echo "Finished mariadb-upgrade"

    # docker_temp_server_stop needs authentication since
    # upgrade ended in FLUSH PRIVILEGES
    echo "Stopping temporary server"
    kill "$MARIADB_PID"
    wait "$MARIADB_PID"
    echo "Temporary server stopped"
}

_check_if_upgrade_is_needed() {
    if [ ! -f "$DATADIR"/mysql_upgrade_info ]; then
        echo "MariaDB upgrade information missing, assuming required"
        return 0
    fi
    local newVersion=, oldVersion
    newVersion="$(_mariadb_version)"
    oldVersion="$(cat "$DATADIR"/mysql_upgrade_info | cut -d- -f1 || true)"

    if [ "${#newVersion}" -lt 2 ] || [ "${#oldVersion}" -lt 2 ] \
      || [ "${oldVersion%%.*}" -lt "${newVersion%%.*}" ]; then
        return 0
    fi

    if [ "${oldVersion%%.*}" -eq "${newVersion%%.*}" ] && [ "$(echo "$oldVersion" | cut -d. -f2)" -lt "$(echo "$newVersion" | cut -d. -f2)" ]; then
        return 0
    fi

    echo "MariaDB upgrade not required"
    return 1
}

# check arguments for an option that would cause mariadb to stop
# return true if there is one
_mysql_want_help() {
    local arg
    for arg; do
        case "$arg" in
            -'?'|--help|--print-defaults|-V|--version) return 0 ;;
        esac
    done
    return 1
}

docker_mariadb_conf() {
  if [ "${MARIADB_RUNTIME_CONF:-1}" != '1' ]; then
      return
  fi

  echo 'MariaDB runtime configuration.'

  conf_env MARIADB_ --twounderscore=- \
  --pattern='!/^MARIADB_(URL|USER|PASSWORD|DATABASE|DB|RUNTIME_CONF|ROOT_PASSWORD|AUTO_UPGRADE|DISABLE_UPGRADE_BACKUP|MYSQL_LOCALHOST_USER|MYSQL_LOCALHOST_GRANTS|ALLOW_EMPTY_ROOT_PASSWORD|RANDOM_ROOT_PASSWORD|INITDB_SKIP_TZINFO|ROOT_HOST)$/' \
  --file="/etc/my.cnf"
}

_main() {
    if [ "${1:0:1}" = '-' ]; then
        set -- mariadb "$@"
    fi

    if [ "$1" = 'mariadbd' ] || [ "$1" = 'mysqld' ] && ! _mysql_want_help "$@"; then
        echo "Entrypoint script for MariaDB Server $(_mariadb_version) started."

        mysql_check_config "$@"
        # Load various environment variables
        docker_setup_env "$@"
        docker_create_db_directories

        # If container is started as root user, restart as dedicated mysql user
        if [ "$(id -u)" = "0" ]; then
            echo "Switching to dedicated user 'mysql'"
            su-exec mysql /docker-entrypoint.d/mariadb.sh "$@"
            docker_mariadb_conf
            return
        fi

        # there's no database, so it needs to be initialized
        if [ -z "$DATABASE_ALREADY_EXISTS" ]; then
            docker_verify_minimum_env

            # check dir permissions to reduce likelihood of half-initialized database
            ls /docker-entrypoint-initdb.d/ > /dev/null

            docker_init_database_dir "$@"

            echo "Starting temporary server"
            docker_temp_server_start "$@"
            echo "Temporary server started."

            docker_setup_db
            docker_process_init_files /docker-entrypoint-initdb.d/*

            echo "Stopping temporary server"
            docker_temp_server_stop
            echo "Temporary server stopped"

            echo
            echo "MariaDB init process done. Ready for start up."
            echo
            # MDEV-27636 mariadb_upgrade --check-if-upgrade-is-needed cannot be run offline
            #elif mariadb-upgrade --check-if-upgrade-is-needed; then
        elif _check_if_upgrade_is_needed; then
            docker_mariadb_upgrade "$@"
        fi
    fi
}

_main "$@"
