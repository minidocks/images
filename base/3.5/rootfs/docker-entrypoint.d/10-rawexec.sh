#!/bin/sh
#
# Set programs that should be run as real user
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ x"$RAWEXEC" = x ]; then
    export RAWEXEC="runitd,crond"
fi
