#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
    set -- jupyter $@
fi

case "$1" in
    console|kernelspec|migrate|nbconvert|nbextension|notebook|qtconsole|serverextension|troubleshoot|trust)
        set -- jupyter $@
    ;;
esac
