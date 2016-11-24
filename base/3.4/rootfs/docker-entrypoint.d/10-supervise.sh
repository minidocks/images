#!/bin/sh
#
# Register runit services
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ x"$SUPERVISE" != x ] && [ ! -w "/etc/sv" ]; then
    printf "Unable to supervise \"%s\" because directory \"/etc/sv\" is not writable\n" "$SUPERVISE" >&2
    return
fi

rm -rf /etc/sv/*

if [ x"$SUPERVISE" != x ]; then
    for _SERVICE in $(echo "$SUPERVISE" | tr "," " "); do
        if [ -d "/etc/service/${_SERVICE}" ]; then
            cp -r "/etc/service/${_SERVICE}" "/etc/sv"
        else
            printf "Unable to find \"/etc/service/%s\" service\n" "$_SERVICE" >&2
        fi
    done
    unset -v _SERVICE
fi
