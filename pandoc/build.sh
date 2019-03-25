#!/bin/sh
set -e

image="${namespace:-minidocs}/pandoc"
versions="
2.3;2.3.1
2.4;2.4
2.5;2.5
2.6;2.6
2.7;2.7.1
latest;2.7.1
"

build() {
    docker build --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
