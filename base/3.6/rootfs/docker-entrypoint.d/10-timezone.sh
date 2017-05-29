#!/bin/sh
#
# Install timezone
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ x"$TIMEZONE" != x ] && [ "$(id -u)" = 0 ]; then
    exec set_tz "$TIMEZONE";
fi
