#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
14-base;14;nodejs<15;base
14;14;nodejs<15
15-base;15;nodejs-current<16;base
15;15;nodejs-current<16
16-base;16;nodejs<17;base
16;16;nodejs<17
17-base;17;nodejs-current<18;base
17;17;nodejs-current<18
18-base;18;nodejs-current<19;base
18;18;nodejs-current<19
lts-base;16;nodejs<17;base
lts;16;nodejs<17
current-base;18;nodejs-current<19;base
current;18;nodejs-current<19
latest;18;nodejs-current<19
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
