#!/bin/sh
set -e

if [ "$(id -u)" = '0' ] && [ x"${PHP_RUNTIME_CONF-1}" = x'1' ]; then
    for _ENV_NAME in $(printenv | awk -F= '{print $1}'); do
        if [ "${_ENV_NAME:0:4}" = "PHP_" ]; then
            _PHP_NAME="$(echo ${_ENV_NAME:4} | sed -e 's|__|\.|g' | tr '[A-Z]' '[a-z]')"
            _PHP_VALUE="$(eval echo \${$_ENV_NAME})"
            sed -i "s|^;\?\($_PHP_NAME =\).*|\1 $_PHP_VALUE|" /etc/php7/php.ini
        fi
    done
fi

if [ "${1:0:1}" = '-' ]; then
    set -- psysh "$@"
fi

if [ "$(id -u)" = '0' ] && [ "$1" = 'psysh' -o "$1" = 'composer' ] && [ "$SUEXEC" = '' ]; then
    SUEXEC="82:82:www-data"
fi

exec su-add-exec "$@"
