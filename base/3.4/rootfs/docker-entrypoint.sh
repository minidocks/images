#!/bin/sh
set -e

for f in /docker-entrypoint.d/*.sh; do
    if [ -r $f ]; then
        . "$f"
    fi
done

EXEC=docker-exec
case $(echo "$RAWEXEC" | tr "," " ") in
    *"$1"*) EXEC=exec ;;
    *) ;;
esac

exec "$EXEC" "$@"
