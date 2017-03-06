#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- certbot $@
fi

case "$1" in
    certonly|config_changes|install|plugins|register|renew|revoke|rollback|run)
        set -- certbot $@
    ;;
esac
