#!/bin/sh
#
# Prefix and suffix PATH
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ -n "$PATH_PREFIX" ]; then
    export PATH="$PATH_PREFIX:$PATH"
fi

if [ -n "$PATH_SUFFIX" ]; then
    export PATH="$PATH:$PATH_SUFFIX"
fi
