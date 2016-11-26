FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV MAILHOG_VERSION 0.2.1

RUN wget -O /usr/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v${MAILHOG_VERSION}/MailHog_linux_amd64 \
    && chmod a+x /usr/bin/mailhog \
    && rm -rf /var/cache/apk/* /tmp/*

EXPOSE 25 80

ENV MH_SMTP_BIND_ADDR 0.0.0.0:25
ENV MH_UI_BIND_ADDR 0.0.0.0:80
ENV MH_API_BIND_ADDR 0.0.0.0:80

CMD ["mailhog"]
