#!/bin/sh
set -e

image="${namespace:-minidocs}/img2pdf"
versions="
0.3;0.3.3
latest;0.3.3
"

build() {
    docker build --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') for version in $versions; do build $(echo "$version" | tr ';' ' '); done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)" | tr ';' ' ')"; if [ -n "$args" ]; then build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
