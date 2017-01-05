#!/bin/sh

set -e

# Add kibana as command if needed
if [ "${1:0:1}" = '-' ]; then
    set -- kibana "$@"
fi

# Run as user "kibana" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
    if [ "$ELASTICSEARCH_URL" ]; then
        sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 '$ELASTICSEARCH_URL'!" /usr/share/kibana/config/kibana.yml
    fi

    if [ "$(id -u)" = 0 ] || [ "$USER_ID" = 0 ]; then
        export USER_NAME="kibana"
        export GROUP_NAME="kibana"
        export USER_ID="$(id -u kibana)"
        export GROUP_ID="$(getent group kibana | awk -F: '{print $3}')"
    fi
fi
