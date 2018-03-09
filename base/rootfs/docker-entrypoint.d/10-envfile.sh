#!/bin/sh
#
# Register file with environment variables
#
# (c) 2018 Martin Hasoň <martin.hason@gmail.com>
#
# ENV_FILE="/path/to/.env"

set -e

if [ -n "$ENV_FILE" ] && [ -f "$ENV_FILE" ]; then
    eval "$(grep -v "^#" "$ENV_FILE" | grep . | sed -e 's/^\([^=]\+\)=/[ -z "$\1" ] \&\& export \1=/')"
fi
