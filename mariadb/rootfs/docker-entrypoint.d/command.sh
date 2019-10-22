#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- mysqld "$@"
fi

if [ "$1" = 'mysqld' ]; then
    export USER_NAME="mysql"
    export GROUP_NAME="mysql"
    export USER_ID="$(id -u mysql)"
    export GROUP_ID="$(getent group mysql | awk -F: '{print $3}')"
fi
