#!/bin/sh
set -e

if [ "${1:0:1}" = '-' ]; then
  set -- terraform "$@"
fi

case "$1" in
  init|validate|plan|apply|destroy)
    set -- terraform "$@"
  ;;
  console|fmt|force-unlock|get|graph|import|login|logout|metadata|output|providers|refresh|show|state|taint|test|untaint|version|workspace)
    set -- terraform "$@"
  ;;
esac
