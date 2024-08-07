#!/bin/sh
set -e

image="${namespace:-minidocks}/python"
versions="
3.11;3.11
3.11-packaging;3.11;packaging
3.11-uwsgi;3.11;uwsgi
3.11-build;3.11;build;-build
3.12;3.11
3.12-packaging;3.12;packaging
3.12-uwsgi;3.12;uwsgi
3.12-build;3.12;build;-build
3;3.12
3-packaging;3.12;packaging
3-build;3.12;build;-build
3-uwsgi;3.12;uwsgi
build;3.12;build;-build
latest;3.12
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target "${3:-latest}" --build-arg suffix="${4:-}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
