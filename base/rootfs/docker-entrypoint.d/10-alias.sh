#!/bin/sh
#
# Register alias commands
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>
#
# ALIAS_WKHTMLTOPDF="ssh root@wkhtmltopdf wkhtmltopdf"

set -e

register_aliases()(
    for name in $(printenv | grep -E "^ALIAS_" | cut -d= -f1); do
        alias="$(echo "${name#*_}" | tr '[:upper:]' '[:lower:]' | sed -e 's|__|-|g')"

        if [ -f "/bin/$alias" ]; then
            printf "\033[33mCommand \"/bin/%s\" for environment variable \"%s\" already exists\033[0m\n" "$alias" "$name" >&2
            continue
        fi

        if [ ! -w /bin ]; then
            printf "\033[30;41mUnable to create file \"/bin/%s\" for environment variable \"%s\" (permission denied)\033[0m\n" "$alias" "$name" >&2
            continue
        fi

        value="$(eval printf '%s' \"\$\{${name}\}\")"
        printf '#!/bin/sh\nset -e\n%s "$@"' "$value" >"/bin/$alias"
        chmod a+x "/bin/$alias"
    done
)

register_aliases

unset -f register_aliases
