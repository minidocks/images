#!/bin/sh
set -e

# allow the container to be started with `--user`
if [ "$1" = 'postgres' ] && [ "$(id -u)" = '0' ]; then
    mkdir -p "$PGDATA"
    chown -R postgres "$PGDATA"
    chmod 700 "$PGDATA"

    mkdir -p /var/run/postgresql
    chown -R postgres /var/run/postgresql
    chmod 775 /var/run/postgresql

    # Create the transaction log directory before initdb is run (below) so the directory is owned by the correct user
    # on PostgreSQL 9.x, this variable is POSTGRES_INITDB_XLOGDIR
    _waldir="${POSTGRES_INITDB_WALDIR:-$POSTGRES_INITDB_XLOGDIR}"
    if [ "$_waldir" ]; then
        mkdir -p "$_waldir"
        chown -R postgres "$_waldir"
        chmod 700 "$_waldir"
    fi
    unset _waldir

    export USER_NAME="postgres"
    export GROUP_NAME="postgres"
    export USER_ID="$(id -u postgres)"
    export GROUP_ID="$(getent group postgres | awk -F: '{print $3}')"
fi

if [ "$1" = 'postgres' ]; then
    mkdir -p "$PGDATA"
    chown -R "$USER_ID" "$PGDATA" 2>/dev/null || :
    chmod 700 "$PGDATA" 2>/dev/null || :

    # look specifically for PG_VERSION, as it is expected in the DB dir
    if [ ! -s "$PGDATA/PG_VERSION" ]; then
        source /bin/file_env
        file_env 'POSTGRES_INITDB_ARGS'
        _waldir="${POSTGRES_INITDB_WALDIR:-$POSTGRES_INITDB_XLOGDIR}"
        if [ "$_waldir" ]; then
            if [ "$(postgres --version | awk '{print $NF}' | cut -d. -f1)" -ge "10" ]; then
                export POSTGRES_INITDB_ARGS="$POSTGRES_INITDB_ARGS --waldir $_waldir"
            else
                export POSTGRES_INITDB_ARGS="$POSTGRES_INITDB_ARGS --xlogdir $_waldir"
            fi
        fi
        unset _waldir
        su-exec "${PGUSER:-postgres}" initdb --username=postgres $POSTGRES_INITDB_ARGS

        # one line url configuration
        file_env 'POSTGRES_URL'
        file_env 'DATABASE_URL'

        # check password first so we can output the warning before postgres
        # messes it up
        file_env 'POSTGRES_PASSWORD' "$(parse_url "${POSTGRES_URL:-$DATABASE_URL}" pass)"
        if [ "$POSTGRES_PASSWORD" ]; then
            pass="PASSWORD '$POSTGRES_PASSWORD'"
            authMethod=md5
        else
            # The - option suppresses leading tabs but *not* spaces. :)
            cat >&2 <<-'EOWARN'
****************************************************
WARNING: No password has been set for the database.
         This will allow anyone with access to the
         Postgres port to access your database. In
         Docker's default configuration, this is
         effectively any other container on the same
         system.

         Use "-e POSTGRES_PASSWORD=password" to set
         it in "docker run".
****************************************************
EOWARN

            pass=
            authMethod=trust
        fi

        { echo; echo "host all all all $authMethod"; } | tee -a "$PGDATA/pg_hba.conf" > /dev/null

        # internal start of server in order to allow set-up using psql-client
        # does not listen on external TCP/IP and waits until start finishes
        su-exec "${PGUSER:-postgres}" pg_ctl -D "$PGDATA" -o "-c listen_addresses='localhost'" -w start

        file_env 'POSTGRES_USER' "$(parse_url "${POSTGRES_URL:-$DATABASE_URL}" user)" "postgres"
        file_env 'POSTGRES_DB' "$(parse_url "${POSTGRES_URL:-$DATABASE_URL}" path)" "$POSTGRES_USER"

        psql="psql -v ON_ERROR_STOP=1"

        if [ "$POSTGRES_DB" != 'postgres' ]; then
            $psql --username postgres -c "CREATE DATABASE $POSTGRES_DB"
        fi

        if [ "$POSTGRES_USER" = 'postgres' ]; then
            op='ALTER'
        else
            op='CREATE'
        fi

        $psql --username postgres -c "$op USER $POSTGRES_USER WITH SUPERUSER $pass"
        echo

        psql="$psql --username $POSTGRES_USER --dbname $POSTGRES_DB"

        echo
        for f in /docker-entrypoint-initdb.d/*; do
            case "$f" in
                *.sh)     echo "$0: running $f"; . "$f" ;;
                *.sql)    echo "$0: running $f"; $psql -f "$f"; echo ;;
                *.sql.gz) echo "$0: running $f"; gunzip -c "$f" | $psql; echo ;;
                *) echo "$0: ignoring $f" ;;
            esac
            echo
        done

        su-exec "${PGUSER:-postgres}" pg_ctl -D "$PGDATA" -m fast -w stop

        echo
        echo 'PostgreSQL init process complete; ready for start up.'
        echo
    fi
fi
