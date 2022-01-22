#!/bin/sh
set -e

image="${namespace:-minidocks}/tesseract"
europe="bel bos bul cat ces cym dan deu ell eng est eus fin fra gle grc hrv hun ita lat lav nor pol por ron rus slk slv spa srp swe ukr"
versions="
4.1;4.1
4;4.1
4-europe;4.1;$europe;lang
5.0;5.0
5;5.0
5-europe;5.0;$europe;lang
latest;5.0
"

for lang in $europe; do versions="
$versions
4-$lang;4.1;$lang;lang
5-$lang;5.0;$lang;lang
"; done

build() {
    IFS=" "
    docker buildx build $docker_opts --target "${4:-latest}" --build-arg lang="$3" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
