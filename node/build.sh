#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
8;3.8;npm nodejs<9
9;3.8;npm nodejs-current<10
10;3.10;npm nodejs<11
11;3.9;npm nodejs-current<12
12;3.11;npm nodejs<13
13;3.11;npm nodejs-current<14
lts;3.11;npm nodejs<13
latest;3.11;npm nodejs-current<14
"

build() {
    docker build $docker_opts --target=latest --build-arg package="$3" --build-arg base_version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
