#!/bin/sh
set -e

image="${namespace:-minidocks}/php"
versions="
5.6;5.6;3.8
5.6-base;5.6;3.8;base
5.6-intl;5.6;3.8;intl
7.0;7.0;3.5
7.0-base;7.0;3.5;base
7.0-intl;7.0;3.5;intl
7.1;7.1;3.7
7.1-base;7.1;3.7;base
7.1-intl;7.1;3.7;intl
7.2;7.2;3.9
7.2-base;7.2;3.9;base
7.2-intl;7.2;3.9;intl
7.3;7.3;3.9
7.3-base;7.3;3.9;base
7.3-intl;7.3;3.9;intl
latest;7.3;3.9
"

build() {
    docker build --target="${4:-latest}" --build-arg base_version="$3" --build-arg major="${2%%.*}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
