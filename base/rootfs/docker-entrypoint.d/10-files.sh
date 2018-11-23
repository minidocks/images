#!/bin/sh
#
# Create files
#
# (c) 2018 Martin Hasoň <martin.hason@gmail.com>
#
# FILE_1_PATH=
# FILE_1_CONTENT=

set -e

create_files()(
    for name in $(printenv | grep -E '^FILE_[^=]+_PATH=' | cut -d= -f1); do
        prefix="${name%_*}"
        path="$(eval printf '%s' \"\$${name}\")"
        content="$(eval printf '%s' \"\$${prefix}_CONTENT\")"

        if [ "$(mkdir -p "$(dirname "$path")")" ] || [ ! -w "$(dirname "$path")" ]; then
            printf "\033[30;41mUnable to create file \"%s\" for environment variable \"%s\" (permission denied)\033[0m\n" "$path" "$name" >&2
            continue
        fi

        printf '%s' "$content" > "$path"
    done
)

create_files

unset -f create_files
