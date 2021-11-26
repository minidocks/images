#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
12-base;3.12;nodejs<13;base
12;3.12;nodejs<13
13-base;3.11;nodejs-current<14;base
13;3.11;nodejs-current<14
14-base;3.14;nodejs<15;base
14;3.14;nodejs<15
15-base;3.13;nodejs-current<16;base
15;3.13;nodejs-current<16
16-base;3.15;nodejs<17;base
16;3.15;nodejs<17
17-base;3.15;nodejs-current<18;base
17;3.15;nodejs-current<18
lts-base;3.15;nodejs<17;base
lts;3.15;nodejs<17
current-base;3.15;nodejs-current<18;base
current;3.15;nodejs-current<18
latest;3.15;nodejs-current<18
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
