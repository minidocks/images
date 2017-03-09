#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- inkscape $@
elif [ -f "$1" ]; then
    set -- inkscape $@
fi
