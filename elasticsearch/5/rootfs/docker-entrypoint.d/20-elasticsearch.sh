#!/bin/sh
set -e

if [ "$(id -u)" = '0' ] && [ x"${ES_RUNTIME_CONF-1}" = x'1' ]; then
    _ES_CONF=/etc/elasticsearch/elasticsearch.yml
    for _ENV_NAME in $(printenv | awk -F= '{print $1}'); do
        if [ "${_ENV_NAME:0:8}" = "ES_CONF_" ]; then
            _ES_NAME="$(echo ${_ENV_NAME:8} | sed -e 's|__|\.|g' | tr '[A-Z]' '[a-z]')"
            _ES_VALUE="$(eval echo \${$_ENV_NAME})"
            if grep "${_ES_NAME}:" "$_ES_CONF" > /dev/null; then
                sed -i "s|^#\?\\s*\($_ES_NAME:\).*|\1 $_ES_VALUE|" "$_ES_CONF"
            else
                echo "${_ES_NAME}: ${_ES_VALUE}" >> "$_ES_CONF"
            fi
        fi
    done
fi
