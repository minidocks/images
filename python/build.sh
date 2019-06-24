#!/bin/sh
set -e

image="${namespace:-minidocks}/python"
versions="
2.7;2.7
3.5;3.5
3.6;3.6
3.6-uwsgi;3.6;uwsgi
3.7;3.7
3.7-uwsgi;3.7;uwsgi
latest;3.7
"

build() {
    docker build --target "${3:-latest}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
