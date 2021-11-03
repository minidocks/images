#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
  set -- infracost "$@"
fi

case "$1" in
  breakdown|completion|configure|diff|help|output|register)
    set -- infracost "$@"
  ;;
esac
