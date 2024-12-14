#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
20-base;20;nodejs<21;base
20;20;nodejs<21
21-base;20;nodejs-current<22;base
21;20;nodejs-current<22
22-base;20;nodejs-current<22;base
22;20;nodejs-current<22
23-base;20;nodejs-current<24;base
23;20;nodejs-current<24
lts-base;22;nodejs<23;base
lts;22;nodejs<23
current-base;23;nodejs-current<24;base
current;23;nodejs-current<24
latest;23;nodejs-current<24
"

build() {
    IFS=" "
    docker buildx build $docker_opts --target=${4:-latest} --build-arg package="$3" --build-arg base_version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
