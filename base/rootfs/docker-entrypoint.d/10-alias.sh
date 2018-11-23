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
        alias="$(echo "${name#*_}" | tr '[:upper:]' '[:lower:]')"

        if [ -f "/usr/local/bin/$alias" ]; then
            printf "\033[30;41mCommand \"/usr/local/bin/%s\" for environment variable \"%s\" already exists\033[0m\n" "$alias" "$name" >&2
            continue
        fi

        if [ ! -w /usr/local/bin ]; then
            printf "\033[30;41mUnable to create file \"/usr/local/bin/%s\" for environment variable \"%s\" (permission denied)\033[0m\n" "$alias" "$name" >&2
            continue
        fi

        value="$(eval printf '%s' \"\$${name}\")"
        printf '#!/bin/sh\nset -e\n %s "$@"' "$value" >"/usr/local/bin/$alias"
        chmod a+x "/usr/local/bin/$alias"
    done
)

register_aliases

unset -f register_aliases
