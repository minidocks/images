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

2020;2020;basic
2020-minimal;2020;minimal
2020-context;2020;context
2020-basic;2020;basic
2020-small;2020;small
2020-gregorio;2020;gregorio
2020-medium;2020;medium
2020-full;2020;full

minimal;2020;minimal
context;2020;context
basic;2020;basic
small;2020;small
gregorio;2020;gregorio
medium;2020;medium
full;2020;full

latest;2020;basic;
"

build() {
    docker build $docker_opts --target "${3:-basic}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
