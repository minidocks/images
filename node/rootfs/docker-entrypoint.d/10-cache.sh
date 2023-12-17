#!/bin/sh
set -e

for dir in "$NPM_CONFIG_CACHE" "$YARN_CACHE_FOLDER" $(echo "$NODE_PATH" | tr ":" "\n"); do
  if [ -n "$dir" ] && [ ! -d "$dir" ]; then
    mkdir -p "$dir"
    chmod -R a+rwX "$dir"
  fi
done

unset -v dir
