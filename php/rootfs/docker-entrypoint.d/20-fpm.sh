#!/bin/sh
set -e

if [ "$(id -u)" != 0 ] || [ x"${PHP_RUNTIME_CONF-1}" != x'1' ]; then
    return
fi

_FPM_CONF="$PHP_INI_DIR/php-fpm.conf"
_FPM_WWW_CONF="$PHP_INI_DIR/php-fpm.d/www.conf"

for _ENV_NAME in $(printenv | awk -F= '{print $1}'); do
    if [ "${_ENV_NAME:0:8}" = "FPM_WWW_" ]; then
        if [ ! -w "$_FPM_WWW_CONF" ]; then
            continue
        fi
        _START=8
        _FILE="$_FPM_WWW_CONF"
    elif [ "${_ENV_NAME:0:4}" = "FPM_" ] && [ -w "$_FPM_CONF" ]; then
        _START=4
        _FILE="$_FPM_CONF"
    else
        continue
    fi

    _FPM_NAME="$(echo "${_ENV_NAME:$_START}" | sed -e 's|__|\.|g' | tr '[:upper:]' '[:lower:]')"
    _FPM_VALUE="$(eval echo "\${$_ENV_NAME}")"
    if grep "${_FPM_NAME} =" "$_FILE" > /dev/null; then
        sed -i "s|^[; ]*\($_FPM_NAME *=\).*|\1 $_FPM_VALUE|" "$_FILE"
    else
        echo "${_FPM_NAME} = ${_FPM_VALUE}" >> "$_FILE"
    fi
done

unset -v _FPM_CONF _FPM_WWW_CONF _FPM_NAME _FPM_VALUE _ENV_NAME _START _FILE
