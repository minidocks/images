#!/bin/sh
set -e

. /bin/file_env

echo "Checking database connection..."
file_env 'DATABASE_URL'
file_env 'MATOMO_DATABASE_HOST' "$(parse_url "$DATABASE_URL" host)"
file_env 'MATOMO_DATABASE_USERNAME' "$(parse_url "$DATABASE_URL" user)"
file_env 'MATOMO_DATABASE_PASSWORD' "$(parse_url "$DATABASE_URL" pass)"
file_env 'MATOMO_DATABASE_PORT' "$(parse_url "$DATABASE_URL" port)" "3306"
file_env 'MATOMO_DATABASE_DBNAME' "$(parse_url "$DATABASE_URL" path)"

if [ -z "$MATOMO_DATABASE_HOST" ]; then
  echo >&2 "ERROR: Either MATOMO_DATABASE_HOST or MATOMO_DATABASE_HOST_FILE must be defined"
  exit 1
fi

if [ -z "$MATOMO_DATABASE_PASSWORD" ]; then
  echo >&2 "ERROR: Either MATOMO_DATABASE_PASSWORD or MATOMO_DATABASE_PASSWORD_FILE must be defined"
  exit 1
fi

echo "Waiting ${WAIT_TIMEOUT:-30}s for database $MATOMO_DATABASE_HOST:$MATOMO_DATABASE_PORT to be ready..."
if ! wait-for -t "${WAIT_TIMEOUT:-30}" "$MATOMO_DATABASE_HOST:$MATOMO_DATABASE_PORT"; then
  echo >&2 "ERROR: Failed to connect to database on $MATOMO_DATABASE_HOST:$MATOMO_DATABASE_PORT"
  exit 1
fi
echo "Database ready!"
