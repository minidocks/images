#!/bin/sh

set -e

if [ "${1:0:1}" = '-' ]; then
    set -- borg $@
fi

case "$1" in
    serve|init|check|change-passphrase|key|migrate-to-repokey|create|extract|rename|delete|list|mount|umount|info|break-lock|prune|upgrade|debug|debug-info|debug-dump-archive-items|debug-dump-repo-objs|debug-get-obj|debug-put-obj|debug-delete-obj|debug-refcount-obj)
        set -- borg "$@"
    ;;
esac
