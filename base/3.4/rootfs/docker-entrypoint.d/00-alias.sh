#!/bin/sh
set -e

for _ENV_NAME in $(printenv | awk -F= '{print $1}'); do
    if [ "${_ENV_NAME:0:6}" = "ALIAS_" ] && [ -w /usr/local/bin ]; then
        _ALIAS_NAME="$(echo "${_ENV_NAME:6}" | tr '[A-Z]' '[a-z]')"
        _ALIAS_VALUE="$(eval echo "\${$_ENV_NAME}")"
        printf '#!/bin/sh\nset -e\nexec %s "$@"' "$_ALIAS_VALUE" > "/usr/local/bin/${_ALIAS_NAME}"
        chmod a+x "/usr/local/bin/${_ALIAS_NAME}"
    fi
done

unset -v _ENV_NAME _ALIAS_NAME _ALIAS_VALUE
