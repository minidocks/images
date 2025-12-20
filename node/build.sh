#!/bin/sh
set -e

image="${namespace:-minidocks}/node"
versions="
22-base;22;nodejs<23;base
22;22;nodejs<23
23-base;23;nodejs-current<24;base
23;23;nodejs-current<24
lts-base;24;nodejs<25;base
lts;24;nodejs<25
current-base;25;nodejs-current<26;base
current;25;nodejs-current<26
latest;25;nodejs-current<26
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
