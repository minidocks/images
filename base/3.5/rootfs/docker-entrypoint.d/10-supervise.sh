#!/bin/sh
#
# Register runit services
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ x"$SUPERVISE" != x ] && [ ! -w "/etc/service" ]; then
    printf "Unable to supervise \"%s\" because directory \"/etc/service\" is not writable\n" "$SUPERVISE" >&2
    return
fi

if [ x"$SUPERVISE" != x ]; then
    for _SERVICE in $(echo "$SUPERVISE" | tr "," " "); do
        if [ -d "/etc/sv/${_SERVICE}" ]; then
            cp -r "/etc/sv/${_SERVICE}" "/etc/service"
        else
            printf "Unable to find \"/etc/sv/%s\" service\n" "$_SERVICE" >&2
        fi
    done
    unset -v _SERVICE
fi
