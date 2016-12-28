#!/bin/sh
#
# Fix directory permission
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ x"$AUTO_CHOWN" != x ]; then
    auto_chown $AUTO_CHOWN &
fi
