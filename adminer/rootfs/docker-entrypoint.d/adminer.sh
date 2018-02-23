#!/bin/sh
set -e

if [ -n "$ADMINER_DESIGN" ]; then
    ln -sf "/var/www/designs/$ADMINER_DESIGN/adminer.css" /var/www/adminer.css
fi
