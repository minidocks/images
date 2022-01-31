#!/bin/sh
set -e

image="${namespace:-minidocks}/java"
java_versions="8 11 17"

versions="
latest;17;headless
gradle;17;gradle
"
for version in $java_versions; do versions="
$versions
$version-jre-nogui;$version;headless
$version-jre-headless;$version;headless
$version-jre;$version;gui
$version-jre-gui;$version;gui
$version;$version;headless
$version-gui;$version;gui
"; done

build() {
    IFS=" "
    docker buildx build $docker_opts --target="$3" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
