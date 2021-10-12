#!/bin/sh
set -e

image="${namespace:-minidocks}/terraform"
platforms="azure aws google kubernetes"
versions="
1
latest
terragrunt;;terragrunt
"

for platform in $platforms; do versions="
$versions
terraformer-$platform;$platform;terraformer
"; done

build() {
    IFS=" "
    docker buildx build $docker_opts --target "${3:-latest}" --build-arg TERRAFORMER_PROVIDER="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
