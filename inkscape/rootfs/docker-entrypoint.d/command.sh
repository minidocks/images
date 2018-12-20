#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ] || [ -f "$1" ]; then
    set -- inkscape $@
fi
