#!/bin/sh
set -e

image="${namespace:-minidocs}/base"
versions="
3.5;3.5
3.6;3.6
3.7;3.7
3.8;3.8
3.8-build;3.8;build
3.9;3.9
3.9-build;3.9;build
edge;edge
edge-build;edge;build
latest;3.9
"

build() {
    docker build --pull --target="${3:-latest}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') for version in $versions; do build $(echo "$version" | tr ';' ' '); done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)" | tr ';' ' ')"; if [ -n "$args" ]; then build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
