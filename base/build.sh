#!/bin/sh
set -e

image="${namespace:-minidocks}/base"
versions="
3.7;3.7
3.8;3.8
3.8-build;3.8;build
3.9;3.9
3.9-build;3.9;build
3.10;3.10
3.10-build;3.10;build
3.11;3.11
3.11-build;3.11;build
3.12;3.12
3.12-build;3.12;build
3.13;3.13
3.13-build;3.13;build
edge;edge
edge-build;edge;build
build;3.13;build
latest;3.13
"

build() {
    docker build $docker_opts --target="${3:-latest}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
