#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- elasticsearch "$@"
fi

if [ "$(id -u)" = '0' ] && [ "$1" = 'elasticsearch' -o  "$1" = 'plugin' ] && [ "$USER_ID" = '0' ]; then
    chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data
    chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/logs
    export USER_NAME="elasticsearch"
    export GROUP_NAME="elasticsearch"
    export USER_ID="$(id -u elasticsearch)"
    export GROUP_ID="$(getent group elasticsearch | awk -F: '{print $3}')"
fi
