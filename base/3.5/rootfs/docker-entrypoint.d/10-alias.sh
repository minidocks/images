#!/bin/sh
#
# Register alias commands
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>
#
# ALIAS_wkhtmltopdf="ssh -y -y root@wkhtmltopdf wkhtmltopdf"

set -e

for _ENV_NAME in $(printenv | awk -F= '{print $1}'); do
    if [ "${_ENV_NAME:0:6}" != "ALIAS_" ]; then
        continue
    fi

    _ALIAS_NAME="$(echo "${_ENV_NAME:6}" | tr '[:upper:]' '[:lower:]')"

    if [ -f "/usr/local/bin/$_ALIAS_NAME" ]; then
        continue
    fi

    if [ ! -w /usr/local/bin ]; then
        printf "\033[30;41mUnable to create file \"/usr/local/bin/%s\" for environment variable \"%s\" (permission denied)\033[0m\n" "$_ALIAS_NAME" "$_ENV_NAME" >&2
        break
    fi

    _ALIAS_VALUE="$(eval echo "\${$_ENV_NAME}")"
    printf '#!/bin/sh\nset -e\nexec %s "$@"' "$_ALIAS_VALUE" > "/usr/local/bin/${_ALIAS_NAME}"
    chmod a+x "/usr/local/bin/${_ALIAS_NAME}"
done

unset -v _ENV_NAME _ALIAS_NAME _ALIAS_VALUE
