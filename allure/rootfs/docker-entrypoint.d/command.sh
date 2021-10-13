#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
  set -- allure "$@"
fi

case "$1" in
  generate|serve|open|plugin)
    set -- allure "$@"
  ;;
esac
