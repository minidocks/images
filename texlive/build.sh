#!/bin/sh
set -e

image="${namespace:-minidocks}/texlive"
versions="
2023;2023;basic
2023-minimal;2023;minimal
2023-context;2023;context
2023-basic;2023;basic
2023-small;2023;small
2023-gregorio;2023;gregorio
2023-medium;2023;medium
2023-full;2023;full

2024;2024;basic
2024-minimal;2024;minimal
2024-context;2024;context
2024-basic;2024;basic
2024-small;2024;small
2024-gregorio;2024;gregorio
2024-medium;2024;medium
2024-full;2024;full

minimal;2024;minimal
context;2024;context
basic;2024;basic
small;2024;small
gregorio;2024;gregorio
medium;2024;medium
full;2024;full

latest;2024;basic;
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
