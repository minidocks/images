#!/bin/sh
set -e

if [ "$(id -u)" = '0' ] && [ x"${PHP_RUNTIME_CONF-1}" = x'1' ]; then
    for _ENV_NAME in $(printenv | awk -F= '{print $1}'); do
        if [ "${_ENV_NAME:0:8}" = "PHP_EXT_" ]; then
            _PHP_EXT="$(echo ${_ENV_NAME:8} | tr '[A-Z]' '[a-z]')"
            _PHP_EXT_FILE="/etc/php5/conf.d/${_PHP_EXT}.ini"
            if [ ! -f ${_PHP_EXT_FILE} ]; then
                continue
            fi

            _PHP_VALUE="$(eval echo \${$_ENV_NAME})"
            if [ x"${_PHP_VALUE}" = x'1' ] || [ x"${_PHP_VALUE}" = x'true' ]; then
                sed -i "s/^[; ]*\(zend_extension\|extension\)/\1/" ${_PHP_EXT_FILE}
            else
                sed -i "s/^[; ]*\(zend_extension\|extension\)/;\1/" ${_PHP_EXT_FILE}
            fi
        elif [ "${_ENV_NAME:0:4}" = "PHP_" ]; then
            _PHP_NAME="$(echo ${_ENV_NAME:4} | sed -e 's|__|\.|g' | tr '[A-Z]' '[a-z]')"
            _PHP_VALUE="$(eval echo \${$_ENV_NAME})"
            sed -i "s|^;\?\($_PHP_NAME =\).*|\1 $_PHP_VALUE|" /etc/php5/php.ini
        fi
    done
fi

if [ "${1:0:1}" = '-' ]; then
    set -- psysh "$@"
fi

if [ "$(id -u)" = '0' ] && [ "$1" = 'psysh' -o "$1" = 'composer' ] && [ "$SUEXEC" = '' ]; then
    SUEXEC="82:82:www-data"
fi

exec docker-exec "$@"
