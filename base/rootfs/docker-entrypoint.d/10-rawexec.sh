#!/bin/sh
#
# Set programs that should be run as real user
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ -z "$RAWEXEC" ]; then
    export RAWEXEC="monit crond supervise sshd"
fi
