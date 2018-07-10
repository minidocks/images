#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- convert $@
elif [ -f "$1" ]; then
    set -- convert $@
fi
