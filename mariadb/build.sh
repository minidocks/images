#!/bin/sh
set -e

image="${namespace:-minidocks}/mariadb"
versions="
10.4;10.4
10.4-sphinx;10.4;sphinx
10.5;10.5
10.5-sphinx;10.5;sphinx
10.6;10.6
10.6-sphinx;10.6;sphinx
latest;10.6
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target "${3:-mariadb}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
