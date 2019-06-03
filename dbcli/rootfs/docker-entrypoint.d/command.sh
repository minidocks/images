#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ] && type "mycli" &> /dev/null; then
    set -- mycli "$@"
elif [ "${1:0:1}" = '-' ] && type "pgcli" &> /dev/null; then
    set -- pgcli "$@"
elif [ "${1:0:1}" = '-' ] && type "litecli" &> /dev/null; then
    set -- litecli "$@"
fi
