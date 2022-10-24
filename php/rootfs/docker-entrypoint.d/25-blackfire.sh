#!/bin/sh
set -e

export PATH="$COMPOSER_HOME/vendor/bin:$PATH"

if [ "$(id -u)" != 0 ] || [ "${PHP_RUNTIME_CONF-1}" != '1' ]; then
  return
fi

conf_env BF_ --template="blackfire.%s" --comment=";" --file="$PHP_INI_DIR/conf.d/blackfire.ini"
conf_env BLACKFIRE_ --template="blackfire.%s" --comment=";" --file="$PHP_INI_DIR/conf.d/blackfire.ini"
