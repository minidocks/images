#!/bin/sh
set -e

image="${namespace:-minidocks}/context"
versions="
beta;latest
beta-with-fonts;latest;fonts
beta-with-docs;latest;docs
current;current
current-with-fonts;current;fonts
current-with-docs;current;docs
lmtx;lmtx
lmtx-with-fonts;lmtx;fonts
lmtx-with-docs;lmtx;docs
latest;lmtx
latest-with-fonts;lmtx;fonts
latest-with-docs;lmtx;docs
"

build() {
    IFS=" "
    distribution="$([ "$2" = "lmtx" ] && echo "lmtx" || echo "standalone")"
    docker_local_opts="${docker_opts:-}"
    if [ "$distribution" = "standalone" ]; then docker_local_opts="$(echo "$docker_local_opts" | sed -e "s/,linux\/arm64//g")"; fi
    docker buildx build $docker_local_opts --target="${3:-latest}" --build-arg distribution="$distribution" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
