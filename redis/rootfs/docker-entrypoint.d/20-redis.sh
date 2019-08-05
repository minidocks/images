#!/bin/sh
set -e

configure_redis()(
  file="/etc/redis.conf"
  for env_name in $(printenv | awk -F= '{print $1}'); do
      if [ "${env_name:0:6}" = "REDIS_" ] && [ -w "$file" ]; then
          name="$(echo "${env_name:6}" | sed -e 's|__|-|g' | tr '[:upper:]' '[:lower:]')"
          value="$(eval echo "\${$env_name}")"
          if grep "^${name} " "$file" > /dev/null; then
              sed -i "s|^\($name\) \+.*|\1 $value|" "$file"
          else
              echo "${name} = ${value}" >> "$file"
          fi
      fi
  done
)

if [ "$(id -u)" != 0 ] || [ "${REDIS_RUNTIME_CONF:-1}" != '1' ]; then
    return
fi

configure_redis
