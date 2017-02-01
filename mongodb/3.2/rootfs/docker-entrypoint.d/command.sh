#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- mongod "$@"
fi

if [ "$1" = 'mongod' ] && [ "$(id -u)" = 0 ]; then
    chown -R mongodb /data/configdb /data/db

    if [ "$USER_ID" = 0 ]; then
        export USER_NAME="mongodb"
        export GROUP_NAME="mongodb"
        export USER_ID="$(id -u mongodb)"
        export GROUP_ID="$(getent group mongodb | awk -F: '{print $3}')"
    fi
fi
