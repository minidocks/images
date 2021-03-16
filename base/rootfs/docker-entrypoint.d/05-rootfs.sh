#!/bin/sh
#
# Copy rootfs
#
# (c) 2018, 2021 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ -d /mnt/rootfs ]; then
    if [ ! -w / ]; then
        printf "\033[30;41mUnable to copy \"/mnt/rootfs\" to \"/\" (permission denied)\033[0m\n" >&2
        return
    fi

    cp -af /mnt/rootfs/. /
fi
