#!/bin/sh
set -e

for dir in "$NPM_CONFIG_CACHE" "$YARN_CACHE_FOLDER" $(echo "$NODE_PATH" | tr ":" "\n"); do
  if [ -n "$dir" ]; then
    mkdir -p "$dir"
    chmod 777 "$dir"
  fi
done

unset -v dir
