#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- phpstan "$@"
fi

case "$1" in
    analyse|help|list)
        set -- phpstan "$@"
    ;;
esac
