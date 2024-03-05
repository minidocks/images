#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- mkdocs "$@"
fi

case "$1" in
    build|get-deps|gh-deploy|new|serve)
        set -- mkdocs "$@"
    ;;
esac
