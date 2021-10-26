#!/bin/sh
#
# Wait https://github.com/ufoscout/docker-compose-wait#additional-configuration-options
#
# (c) 2021 Martin Hasoň <martin.hason@gmail.com>

set -e

wait_hosts()(
  if [ -n "$WAIT_BEFORE" ]; then
    sleep "$WAIT_BEFORE"
  fi

  if [ -n "$WAIT_HOSTS" ]; then
    for host in $WAIT_HOSTS; do
      wait-for -t "${WAIT_TIMEOUT:-30}" "$host"
    done
  fi

  if [ -n "$WAIT_AFTER" ]; then
    sleep "$WAIT_AFTER"
  fi
)

wait_hosts
