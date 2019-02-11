#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ] || [ -f "$1" -a ! -x "$1" ]; then
    set -- context "$@"
fi
