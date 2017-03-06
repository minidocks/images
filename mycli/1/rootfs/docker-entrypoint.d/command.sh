#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- mycli $@
elif ! type "$1" &> /dev/null; then
    set -- mycli $@
fi
