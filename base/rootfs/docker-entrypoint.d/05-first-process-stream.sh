#!/bin/sh
#
# Create named pipes for the stdout and stderr
#
# (c) 2018 Martin Hasoň <martin.hason@gmail.com>
#
# https://en.wikipedia.org/wiki/Named_pipe
# https://github.com/moby/moby/issues/19616#issuecomment-174355979
# https://stackoverflow.com/questions/8410439/how-to-avoid-echo-closing-fifo-named-pipes-funny-behavior-of-unix-fifos

set -e

if [ -w /dev ]; then
    if [ ! -e /dev/stdout.pipe ]; then
        mkfifo /dev/stdout.pipe
        chmod a+rw /dev/stdout.pipe
        cat <>/dev/stdout.pipe > /proc/1/fd/1 &
    fi

    if [ ! -e /dev/stderr.pipe ]; then
        mkfifo /dev/stderr.pipe
        chmod a+rw /dev/stderr.pipe
        cat <>/dev/stderr.pipe > /proc/1/fd/2 &
    fi
fi
