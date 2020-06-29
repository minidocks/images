#!/bin/sh
set -e

image="${namespace:-minidocks}/java"
versions="
7-jre-nogui;7;headless
7-jre-headless;7;headless
7-jre;7;gui
7-jre-gui;7;gui
7;7;headless
7-gui;7;gui
8-jre-nogui;8;headless
8-jre-headless;8;headless
8-jre;8;gui
8-jre-gui;8;gui
8;8;headless
8-gui;8;gui
8-gradle;8;gradle
9-jre-nogui;9;headless
9-jre-headless;9;headless
9-jre;9;gui
9-jre-gui;9;gui
9;9;headless
9-gui;9;gui
10-jre-nogui;10;headless
10-jre-headless;10;headless
10-jre;10;gui
10-jre-gui;10;gui
10;10;headless
10-gui;10;gui
11-jre-nogui;11;headless
11-jre-headless;11;headless
11-jre;11;gui
11-jre-gui;11;gui
11;11;headless
11-gui;11;gui
latest;11;headless
"

build() {
    docker build $docker_opts --target="$3" --build-arg version="$2" -t "$image:$1" "$(dirname $0)"
}

case "$1" in
    --versions) echo "$versions" | awk 'NF' | cut -d';' -f1;;
    '') echo "$versions" | grep -v "^$" | while read -r version; do IFS=';'; build $version; done;;
    *) args="$(echo "$versions" | grep -E "^$1(;|$)")"; if [ -n "$args" ]; then IFS=';'; build $args; else echo "Version $1 does not exist." >/dev/stderr; exit 1; fi
esac
