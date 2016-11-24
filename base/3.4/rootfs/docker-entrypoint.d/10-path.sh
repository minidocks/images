#!/bin/sh
#
# Prefix and suffix PATH
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ x"$PATH_PREFIX" != x ]; then
    export PATH="$PATH_PREFIX:$PATH"
fi

if [ x"$PATH_SUFFIX" != x ]; then
    export PATH="$PATH:$PATH_SUFFIX"
fi
