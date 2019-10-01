#!/bin/sh
set -e

image="${namespace:-minidocks}/texlive"
versions="
2018;2018;basic
2018-minimal;2018;minimal
2018-context;2018;context
2018-basic;2018;basic
2018-small;2018;small
2018-gregorio;2018;gregorio
2018-medium;2018;medium
2018-full;2018;full

2019;2019;basic
2019-minimal;2019;minimal
2019-context;2019;context
2019-basic;2019;basic
2019-small;2019;small
2019-gregorio;2019;gregorio
2019-medium;2019;medium
2019-full;2019;full

minimal;2019;minimal
context;2019;context
basic;2019;basic
small;2019;small
gregorio;2019;gregorio
medium;2019;medium
full;2019;full

latest;2019;basic;
"

build() {
    docker build $docker_opts --target "${3:-basic}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
