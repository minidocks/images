#!/bin/sh
set -e

image="${namespace:-minidocs}/inkscape"
versions="
0.92
latest
"

build() {
    docker build --pull -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') for version in $versions; do build $(echo "$version" | tr ';' ' '); done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)" | tr ';' ' ')"; if [ -n "$args" ]; then build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
