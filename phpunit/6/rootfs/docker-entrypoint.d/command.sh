#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- phpunit "$@"
fi

if [ -d "$1" ] || [ -f "$1" ]; then
    set -- phpunit $@
fi
