#!/bin/sh
#
# Main docker entry point
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>
#

set -e

for _FILE in /docker-entrypoint.d/*.sh; do
    if [ -r "$_FILE" ]; then
        . "$_FILE"
    fi
done

unset -v _FILE

if [ x"$(echo "$@")" = x ]; then
    return
fi

if [ "$(id -u)" = 0 ] && [ x"$(echo " $RAWEXEC " | tr "," " " | grep " $1 ")" = x ]; then
    exec /sbin/tini -s -g -- su-exec "${USER_ID:-$(id -u)}:${GROUP_ID:-$(id -g)}" "$@"
else
    exec /sbin/tini -s -g -- "$@"
fi
