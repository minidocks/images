#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- php-cs-fixer "$@"
fi

case "$1" in
    describe|fix|help|list|readme|self-update|selfupdate)
        set -- php-cs-fixer "$@"
    ;;
esac
