#!/bin/sh
set -e

image="${namespace:-minidocks}/tesseract"
europe="bel bul cat ces dan deu est eus fin fra grc hrv hun ita lav nor pol por ron rus slk slv spa srp swe ukr"
versions="
5
5-europe;$europe;lang
latest
"

for lang in $europe; do versions="
$versions
5-$lang;$lang;lang
"; done

build() {
    IFS=" "
    docker buildx build $docker_opts --target "${3:-latest}" --build-arg lang="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
