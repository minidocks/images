FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG mailhog_version=1.0.0

RUN wget -O /usr/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v${mailhog_version}/MailHog_linux_amd64 \
    && chmod a+x /usr/bin/mailhog \
    && clean

EXPOSE 25 80

ENV MH_SMTP_BIND_ADDR=0.0.0.0:25 \
    MH_UI_BIND_ADDR=0.0.0.0:80 \
    MH_API_BIND_ADDR=0.0.0.0:80

CMD [ "mailhog" ]
