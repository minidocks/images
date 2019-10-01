#!/bin/sh
set -e

image="${namespace:-minidocks}/sphinx-doc"
versions="
1.6;1.6.7
1.7;1.7.9
1.8;1.8.5
2.0;2.0.1
2.1;2.1.2
2.2;2.2.0
latest;2.2.0
"

build() {
    docker build $docker_opts --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
