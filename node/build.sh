#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
16-base;16;nodejs<17;base
16;16;nodejs<17
18-base;18;nodejs<19;base
18;18;nodejs<19
19-base;19;nodejs-current<20;base
19;19;nodejs-current<20
20-base;20;nodejs-current<21;base
20;20;nodejs-current<21
lts-base;18;nodejs<19;base
lts;18;nodejs<19
current-base;20;nodejs-current<21;base
current;20;nodejs-current<21
latest;20;nodejs-current<21
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
