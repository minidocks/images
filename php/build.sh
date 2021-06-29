#!/bin/sh
set -e

image="${namespace:-minidocks}/php"
versions="
7.2;7.2
7.2-base;7.2;base
7.2-nginx;7.2;nginx
7.2-intl;7.2;intl
7.3;7.3
7.3-base;7.3;base
7.3-nginx;7.3;nginx
7.3-intl;7.3;intl
7.4;7.4
7.4-base;7.4;base
7.4-nginx;7.4;nginx
7.4-intl;7.4;intl
8.0;8.0
8.0-base;8.0;base
8.0-nginx;8.0;nginx
8.0-intl;8.0;intl
latest;8.0
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target="${3:-latest}" --build-arg major="${2%%.*}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
