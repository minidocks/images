#!/bin/sh
set -e

for dir in "$NPM_CONFIG_CACHE" "$YARN_CACHE_FOLDER"; do
  if [ -n "$dir" ]; then
    mkdir -p "$dir"
    chmod 777 "$dir"
  fi
done

unset -v dir
