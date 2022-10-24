#!/bin/sh
set -e

export PATH="$COMPOSER_HOME/vendor/bin:$PATH"

if [ "$(id -u)" != 0 ] || [ "${PHP_RUNTIME_CONF-1}" != '1' ]; then
  return
fi

nr_file="$PHP_INI_DIR/conf.d/newrelic.ini"
if [ -f "$nr_file" ] && [ -w "$nr_file" ]; then
  conf_env NR_ --comment=";" --template="newrelic.%s" --file="$nr_file"
  conf_env NEW_RELIC_ --comment=";" --template="newrelic.%s" --file="$nr_file"
  conf_env NEWRELIC_ --comment=";" --template="newrelic.%s" --file="$nr_file"
fi
unset -v nr_file
