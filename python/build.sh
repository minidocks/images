#!/bin/sh
set -e

image="${namespace:-minidocks}/python"
versions="
2.7;2.7;base
3.5;3.5;v35
3.6;3.6;base
3.6-uwsgi;3.6;base;uwsgi
latest;3.6;base
"

build() {
    docker build --target "${4:-latest}" --build-arg base_version="$3" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
