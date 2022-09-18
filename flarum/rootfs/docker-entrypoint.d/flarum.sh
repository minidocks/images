#!/bin/sh
set -e

. /bin/file_env

file_env "FLARUM_BASE_URL" "http://localhost:8000"

echo "Checking database connection..."
file_env 'DATABASE_URL'
file_env 'MYSQL_HOST' "$(parse_url "$DATABASE_URL" host)"
file_env 'MYSQL_USER' "$(parse_url "$DATABASE_URL" user)"
file_env 'MYSQL_PASSWORD' "$(parse_url "$DATABASE_URL" pass)"
file_env 'MYSQL_PORT' "$(parse_url "$DATABASE_URL" port)" "3306"
file_env 'MYSQL_DATABASE' "$(parse_url "$DATABASE_URL" path)"

if [ -z "$MYSQL_HOST" ]; then
  echo >&2 "ERROR: Either MYSQL_HOST or MYSQL_HOST_FILE must be defined"
  exit 1
fi

if [ -z "$MYSQL_PASSWORD" ]; then
  echo >&2 "ERROR: Either MYSQL_PASSWORD or MYSQL_PASSWORD_FILE must be defined"
  exit 1
fi

echo "Waiting ${WAIT_TIMEOUT:-30}s for database $MYSQL_HOST:$MYSQL_PORT to be ready..."
if ! wait-for -t "${WAIT_TIMEOUT:-30}" "$MYSQL_HOST:$MYSQL_PORT"; then
  echo >&2 "ERROR: Failed to connect to database on $MYSQL_HOST:$MYSQL_PORT"
  exit 1
fi
echo "Database ready!"

counttables=$(php -r 'echo (new mysqli($_SERVER["MYSQL_HOST"], $_SERVER["MYSQL_USER"], $_SERVER["MYSQL_PASSWORD"], $_SERVER["MYSQL_DATABASE"], $_SERVER["MYSQL_PORT"]))->query("SHOW TABLES")->num_rows;')

if [ "${counttables}" -eq "0" ]; then
  echo "Installation ..."

  file_env 'FLARUM_ADMIN_NAME' 'flarum'
  file_env 'FLARUM_ADMIN_PASSWORD' 'flarum'
  file_env 'FLARUM_ADMIN_EMAIL' "${FLARUM_ADMIN_NAME}@example.org"

  echo "Creating installation config ..."
  su-exec www-data:www-data cat >/tmp/config.yml <<EOL
debug: ${FLARUM_DEBUG}
baseUrl: ${FLARUM_BASE_URL}
databaseConfiguration:
  driver: mysql
  host: ${MYSQL_HOST}
  database: ${MYSQL_DATABASE}
  username: ${MYSQL_USER}
  password: ${MYSQL_PASSWORD}
  prefix: ${FLARUM_TABLE_PREFIX}
  port: ${MYSQL_PORT}
adminUser:
  username: "${FLARUM_ADMIN_NAME}"
  password: "${FLARUM_ADMIN_PASSWORD}"
  password_confirmation: "${FLARUM_ADMIN_PASSWORD}"
  email: "${FLARUM_ADMIN_EMAIL}"
settings:
  forum_title: "${FLARUM_FORUM_TITLE}"
EOL

  echo "Installing flarum in $(pwd) ..."
  su-exec www-data:www-data flarum install -vvv --file=/tmp/config.yml
  echo ">>"
  if [ "${FLARUM_ADMIN_NAME}" = 'flarum' ] && [ "${FLARUM_ADMIN_PASSWORD}" = 'flarum' ]; then
    echo ">> WARNING: Flarum has been installed with the default credentials (flarum/flarum)"
  fi
  echo ">> Please connect to ${FLARUM_BASE_URL} and change them!"
  echo ">>"
fi

if [ -f /var/www/config.php.dist ]; then
  echo "Creating /var/www/config.php ..."
  cp /var/www/config.php.dist /var/www/config.php
fi

if [ -w /var/www/config.php ]; then
  echo "Updating /var/www/config.php ..."
  escape() {
    echo "$1" | sed 's|/|\\/|g' | sed "s/'/\\\'/g"
  }

  sed -i -Ee "s/('debug' => ).+$/\\1\(bool\) $(escape "${FLARUM_DEBUG:-false}"),/g" \
    -Ee "s/('offline' => ).+$/\\1\(bool\) $(escape "${FLARUM_OFFLINE:-false}"),/g" \
    -Ee "s/('host' => ).+$/\\1'$(escape "${MYSQL_HOST}")',/g" \
    -Ee "s/(        'database' => ).+$/\\1'$(escape "${MYSQL_DATABASE}")',/g" \
    -Ee "s/('username' => ).+$/\\1'$(escape "${MYSQL_USER}")',/g" \
    -Ee "s/('password' => ).+$/\\1'$(escape "${MYSQL_PASSWORD}")',/g" \
    -Ee "s/('prefix' => ).+$/\\1'$(escape "${FLARUM_TABLE_PREFIX}")',/g" \
    -Ee "s/('port' => ).+$/\\1'$(escape "${MYSQL_PORT}")',/g" \
    -Ee "s/('url' => ).+$/\\1'$(escape "${FLARUM_BASE_URL}")',/g" \
    -Ee "s/('api' => ).+$/\\1'$(escape "${FLARUM_API_PATH:-api}")',/g" \
    -Ee "s/('admin' => ).+$/\\1'$(escape "${FLARUM_ADMIN_PATH:-admin}")',/g" \
    -Ee "s/('poweredByHeader' => ).+$/\\1'$(escape "${FLARUM_POWEREDBY_HEADER:-}")',/g" \
    -Ee "s/('referrerPolicy' => ).+$/\\1'$(escape "${FLARUM_REFERRER_POLICY:-}")',/g" \
    -Ee "s/('samesite' => ).+$/\\1'$(escape "${FLARUM_COOKIE_SAMESITE:-lax}")',/g" \
    -Ee "s/('post_max_size', ).+$/\\1'$(escape "${PHP_POST_MAX_SIZE:-${UPLOAD_MAX_SIZE:-10M}}")');/g" \
    -Ee "s/('upload_max_filesize', ).+$/\\1'$(escape "${PHP_UPLOAD_MAX_FILESIZE:-${UPLOAD_MAX_SIZE:-10M}}")');/g" \
    /var/www/config.php
fi

su-exec www-data:www-data flarum migrate
su-exec www-data:www-data flarum cache:clear
su-exec www-data:www-data flarum assets:publish
