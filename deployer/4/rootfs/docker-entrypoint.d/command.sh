#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- dep "$@"
fi

if [ ! $(dep list --format=xml | grep "<command>$1</command>") = "" ]; then
    set -- dep "$@"
fi
