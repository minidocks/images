#!/bin/sh
set -e

image="${namespace:-minidocks}/base"
versions="
3.21;3.21
3.21-build;3.21;build
3.22;3.22
3.22-build;3.22;build
3.23;3.23
3.23-build;3.23;build
edge;edge
edge-build;edge;build
build;3.23;build
latest;3.23
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target="${3:-latest}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
