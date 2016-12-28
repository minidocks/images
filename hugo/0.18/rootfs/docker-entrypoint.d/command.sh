#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- hugo $@
fi

case "$1" in
    benchmark|check|config|convert|env|gen|import|list|new|server|undraft|version)
        set -- hugo $@
    ;;
esac
