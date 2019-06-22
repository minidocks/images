#!/bin/sh
set -e

image="${namespace:-minidocks}/java"
versions="
8-jre-nogui;headless
8-jre-headless;headless
8-jre;gui
8-jre-gui;gui
8;headless
8-gui;gui
latest;headless
"

build() {
    docker build --target="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
