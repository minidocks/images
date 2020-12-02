#!/bin/sh
#
# Install timezone
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ -n "${TIMEZONE:-$TZ}" ] && [ "$(id -u)" = 0 ]; then
    set_tz "${TIMEZONE:-$TZ}"
fi
