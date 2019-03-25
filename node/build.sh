#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
6;3.6;nodejs-npm<7
7;3.6;nodejs-current-npm<8
8;3.8;npm nodejs<9
9;3.8;npm nodejs-current<10
10;3.9;npm nodejs<11
11;3.9;npm nodejs-current<12
lts;3.9;npm nodejs<11
latest;3.9;npm nodejs-current<12
"

build() {
    docker build --target=latest --build-arg package="$3" --build-arg base_version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
