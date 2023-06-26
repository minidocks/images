#!/bin/sh
set -e

image="${namespace:-minidocks}/python"
versions="
2.7;2.7
2.7-packaging;2.7;packaging
2.7-build;2.7;build;-build
2;2.7
2-packaging;2.7;packaging
2-build;2.7;build;-build
3.9;3.9
3.9-packaging;3.9;packaging
3.9-uwsgi;3.9;uwsgi
3.9-build;3.9;build;-build
3.10;3.10
3.10-packaging;3.10;packaging
3.10-uwsgi;3.10;uwsgi
3.10-build;3.10;build;-build
3.11;3.11
3.11-packaging;3.11;packaging
3.11-uwsgi;3.11;uwsgi
3.11-build;3.11;build;-build
3;3.11
3-packaging;3.11;packaging
3-build;3.11;build;-build
3-uwsgi;3.11;uwsgi
build;3.11;build;-build
latest;3.11
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
