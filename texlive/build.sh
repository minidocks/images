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

2021;2021;basic
2021-minimal;2021;minimal
2021-context;2021;context
2021-basic;2021;basic
2021-small;2021;small
2021-gregorio;2021;gregorio
2021-medium;2021;medium
2021-full;2021;full

minimal;2021;minimal
context;2021;context
basic;2021;basic
small;2021;small
gregorio;2021;gregorio
medium;2021;medium
full;2021;full

latest;2021;basic;
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target "${3:-basic}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
