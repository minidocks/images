#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
18-base;18;nodejs<19;base
18;18;nodejs<19
20-base;20;nodejs<21;base
20;20;nodejs<21
21-base;20;nodejs-current<22;base
21;20;nodejs-current<22
lts-base;20;nodejs<21;base
lts;20;nodejs<21
current-base;21;nodejs-current<22;base
current;21;nodejs-current<22
latest;21;nodejs-current<22
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
