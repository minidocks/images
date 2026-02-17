#!/bin/sh
set -e

export PATH="$COMPOSER_HOME/vendor/bin:$PATH"

if [ "$(id -u)" != 0 ] || [ "${PHP_RUNTIME_CONF-1}" != '1' ]; then
  return
fi

conf_env PHP_ --pattern='!/^PHP_EXT_/' --comment=";" --file="$PHP_INI_DIR/php.ini"

conf_env "PHP_EXT_" | while read -r extension value; do
  file="$(find "$PHP_INI_DIR/conf.d" -name "*${extension}.ini" | head -1)"
  if [ ! -f "$file" ] || [ ! -w "$file" ]; then
    return
  fi

  if [ "${value}" = 1 ] || [ "${value}" = true ]; then prefix=; else prefix=";"; fi
  sed -i "s/^[; ]*\(zend_extension\|extension\)/${prefix}\1/" "$file"
done
