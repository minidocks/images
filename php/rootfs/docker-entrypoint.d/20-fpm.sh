#!/bin/sh
set -e

if [ "$(id -u)" != 0 ] || [ "${PHP_RUNTIME_CONF-1}" != '1' ]; then
  return
fi

conf_env FPM_ --pattern='!/^FPM_WWW_/' --comment=";" --file="$PHP_INI_DIR/php-fpm.conf"
conf_env FPM_WWW_ --comment=";" --file="$PHP_INI_DIR/php-fpm.d/www.conf"
