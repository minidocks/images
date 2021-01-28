#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
8-base;3.8;nodejs<9;base
8;3.8;nodejs<9
9-base;3.8;nodejs-current<10;base
9;3.8;nodejs-current<10
10-base;3.10;nodejs<11;base
10;3.10;nodejs<11
11-base;3.9;nodejs-current<12;base
11;3.9;nodejs-current<12
12-base;3.12;nodejs<13;base
12;3.12;nodejs<13
13-base;3.11;nodejs-current<14;base
13;3.11;nodejs-current<14
14-base;3.13;nodejs<15;base
14;3.13;nodejs<15
15-base;3.13;nodejs-current<16;base
15;3.13;nodejs-current<16
lts-base;3.13;nodejs<15;base
lts;3.13;nodejs<15
latest;3.13;nodejs-current<16
"

build() {
    docker build $docker_opts --target=${4:-latest} --build-arg package="$3" --build-arg base_version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
