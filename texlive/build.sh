#!/bin/sh
set -e

image="${namespace:-minidocks}/texlive"
versions="
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

2022;2022;basic
2022-minimal;2022;minimal
2022-context;2022;context
2022-basic;2022;basic
2022-small;2022;small
2022-gregorio;2022;gregorio
2022-medium;2022;medium
2022-full;2022;full

2023;2023;basic
2023-minimal;2023;minimal
2023-context;2023;context
2023-basic;2023;basic
2023-small;2023;small
2023-gregorio;2023;gregorio
2023-medium;2023;medium
2023-full;2023;full

minimal;2023;minimal
context;2023;context
basic;2023;basic
small;2023;small
gregorio;2023;gregorio
medium;2023;medium
full;2023;full

latest;2023;basic;
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
