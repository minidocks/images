#!/bin/sh
set -e

image="${namespace:-minidocks}/postgres"
versions="
10;10
10-czech;10;czech
11;11
11-czech;11;czech
12;12
12-czech;12;czech
13;13
13-czech;13;czech
czech;13;czech
latest;13
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
