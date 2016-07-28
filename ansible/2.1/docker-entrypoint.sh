#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- ansible "$@"
fi

if [ "$(id -u)" = '0' ] && [ "$1" = 'ansible' ] && [ x"$SUEXEC" = x'' ]; then
    SUEXEC="$(id -u ansible):$(id -g ansible):ansible"
fi

exec docker-exec "$@"
