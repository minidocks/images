FROM webuni/base:3.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add postfix libsasl \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

EXPOSE 25

RUN touch /etc/postfix/sasl_passwd && chmod 600 /etc/postfix/sasl_passwd

ENV POSTFIX_MYHOSTNAME=hostname \
    POSTFIX_MYDOMAIN=localhost \
    POSTFIX_MYNETWORKS=0.0.0.0/0 \
    POSTFIX_SMTPUTF8_ENABLE=no \
    POSTFIX_SMTP_TLS_SECURITY_LEVEL=may \
    POSTFIX_SMTPD_TLS_SECURITY_LEVEL=none

CMD [ "supervise", "postfix" ]

# https://github.com/wader/postfix-relay
