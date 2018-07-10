#!/bin/sh
#
# Create named pipes for the first process
#
# (c) 2018 Martin Hasoň <martin.hason@gmail.com>
#
# https://en.wikipedia.org/wiki/Named_pipe
#

set -e

if [ -w /dev ]; then
    mkfifo /dev/stdout.pipe
    mkfifo /dev/stderr.pipe
    chmod a+rw /dev/stdout.pipe /dev/stderr.pipe

    cat /dev/stdout.pipe > /proc/1/fd/1 &
    cat /dev/stderr.pipe > /proc/1/fd/2 &
fi
