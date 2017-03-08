#!/bin/sh
set -e

for _var in $(printenv | awk -F= '{print $1}'); do
    if [ "${_var:0:8}" = "POSTFIX_" ]; then
        _name="$(echo "${_var:8}" | sed -e 's|__|\.|g' | tr '[:upper:]' '[:lower:]')"
        _value="$(eval echo "\${$_var}")"
        postconf -e "${_name}=${_value}"
    fi
done

if [ -n "$SMTP_SERVER" ] && [ -n "$SMTP_USERNAME" ] && [ -n "$SMTP_PASSWORD" ]; then
    echo "${SMTP_SERVER} ${SMTP_USERNAME}:${SMTP_PASSWORD}" >> /etc/postfix/sasl_passwd
fi
