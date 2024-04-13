#!/bin/sh
set -e

image="${namespace:-minidocks}/ansible"
versions="
4;ansible<5
5;ansible<6
6;ansible<7
7;ansible<8
8;ansible<9
9;ansible<10
10;ansible<11
latest;ansible
"

build() {
    IFS=" "
    docker buildx build $docker_opts --build-arg ansible_package="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
