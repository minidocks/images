#!/bin/sh
set -e

image="${namespace:-minidocks}/pandoc"
versions="
2.5;2.5;linux
2.6;2.6;linux
2.7;2.7.3;linux
2.8;2.8.1.1;linux-amd64
2.9;2.9.2;linux-amd64
latest;2.9.2;linux-amd64
"

build() {
    docker build $docker_opts --build-arg platform="$3" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
