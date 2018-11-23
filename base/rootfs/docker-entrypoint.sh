#!/bin/sh
#
# Main docker entry point
#
# (c) 2016, 2018 Martin Hasoň <martin.hason@gmail.com>

set -e

load_entrypoints(){
    local file

    for file in /docker-entrypoint.d/*.sh; do
        if [ -r "$file" ]; then
            . "$file"
        fi
    done
}

load_entrypoints

if [ -z "$(printf '%s' "$@")" ]; then
    return
fi

if [ "$(id -u)" = 0 ] && [ -z "$(echo " $RAWEXEC " | tr ',' ' ' | grep " $1 ")" ]; then
    exec /sbin/tini -s -g -- su-exec "${USER_ID:-$(id -u)}:${GROUP_ID:-$(id -g)}" "$@"
else
    exec /sbin/tini -s -g -- "$@"
fi
