#!/bin/sh
#
# Fix /dev/std* permission for non-root user
#
# (c) Martin Hasoň <martin.hason@gmail.com>
#
# https://github.com/moby/moby/issues/31243#issuecomment-315059185
# https://github.com/moby/moby/issues/31243#issuecomment-406879017

set -e

if [ -w /dev ]; then
  chmod o+w /dev/stdout
  chmod o+w /dev/stderr

  if [ -n "$USER_NAME" ]; then
    addgroup "$USER_NAME" tty
  fi
fi
