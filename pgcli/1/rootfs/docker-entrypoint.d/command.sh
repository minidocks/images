#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- pgcli $@
elif ! type "$1" &> /dev/null; then
    set -- pgcli $@
fi
