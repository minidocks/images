#!/bin/sh
set -e

if [ -f "$VENV_PATH"/bin/activate ]; then
    source "${VENV_PATH}/bin/activate"
fi

if [ "${1:0:1}" = '-' ]; then
    set -- python "$@"
fi
