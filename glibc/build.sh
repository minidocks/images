#!/bin/sh
set -e

image="${namespace:-minidocks}/glibc"
versions="
3.11;3.11
3.11-i18n;3.11;i18n
3.11-dev;3.11;dev
3.12;3.12
3.12-i18n;3.12;i18n
3.12-dev;3.12;dev
3.13;3.13
3.13-i18n;3.13;i18n
3.13-dev;3.13;dev
3.14;3.14
3.14-i18n;3.14;i18n
3.14-dev;3.14;dev
latest;3.14
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target="${3:-latest}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
