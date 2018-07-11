#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
    set -- redis-server "$@"
fi

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' ] && [ "$(id -u)" = '0' ]; then
    chown -R redis .
    export USER_NAME="redis"
    export GROUP_NAME="redis"
    export USER_ID="$(id -u redis)"
    export GROUP_ID="$(id -g redis)"
fi
