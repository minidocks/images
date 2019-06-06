#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ] || [ "$1" = print ] || [ "$1" = screenshot ]; then
    set -- puppeteer "$@"
fi
