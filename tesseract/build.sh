#!/bin/sh
set -e

image="${namespace:-minidocks}/tesseract"
europe="bel bos bul cat ces cym dan deu ell eng est eus fin fra gle grc hrv hun ita lat lav nor pol por ron rus slk slv spa srp swe ukr"
versions="
3;3.04.00;38
4.0;4.0.0;310
4.1;4.0.0;edge
4;4.0.0;edge
latest;4.0.0;edge
4-europe;4.0.0;edge;$europe;lang
"

for lang in $europe; do versions="
$versions
4-$lang;4.0.0;edge;$lang;lang
"; done

build() {
    docker build $docker_opts --target "${5:-latest}" --build-arg lang="$4" --build-arg repository="$3" --build-arg data_version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
