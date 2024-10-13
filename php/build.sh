#!/bin/sh
set -e

image="${namespace:-minidocks}/php"
versions="
8.1;8.1;81
8.1-base;8.1;81;base
8.1-nginx;8.1;81;nginx
8.1-intl;8.1;81;intl
8.2;8.2;82
8.2-base;8.2;82;base
8.2-nginx;8.2;82;nginx
8.2-intl;8.2;82;intl
8.3;8.3;83
8.3-base;8.3;83;base
8.3-nginx;8.3;83;nginx
8.3-intl;8.3;83;intl
latest;8.3;83
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target="${4:-latest}" --build-arg suffix="${3}" --build-arg major="${2%%.*}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
