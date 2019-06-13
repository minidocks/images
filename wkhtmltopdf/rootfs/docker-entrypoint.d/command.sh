#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ] || [ -f "$1" ] || [ -n "$(wget -S --spider -O/dev/null "$1" 2>&1 | grep 'HTTP')" ]; then
    set -- wkhtmltopdf "$@"
fi
