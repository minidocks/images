#!/bin/sh
#
# Fix directory permission
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ -n "$AUTO_CHOWN" ]; then
    auto_chown $AUTO_CHOWN &
fi
