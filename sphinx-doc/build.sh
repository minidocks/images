#!/bin/sh
set -e

image="${namespace:-minidocks}/sphinx-doc"
versions="
4;4.5.0
4-pdf;4.5.0;weasyprint;pdf
5;5.0.2
5-pdf;5.0.2;weasyprint;pdf
pdf;5.0.2;weasyprint;pdf
latest;5.0.2
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target="${4:-latest}" --build-arg base_image="${3:-python}" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
