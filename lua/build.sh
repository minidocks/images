#!/bin/sh
set -e

image="${namespace:-minidocks}/lua"
versions="
5.1;5.1
5.2;5.2
5.3;5.3
5.4;5.4
5.1-build;5.1;build
5.2-build;5.2;build
5.3-build;5.3;build
5.4-build;5.4;build
build;5.4;build
latest;5.4
"

build() {
    IFS=" "
    docker buildx build $docker_opts --build-arg base="${3:-latest}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
