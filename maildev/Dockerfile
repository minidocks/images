FROM minidocks/node
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN npm install -g maildev && clean

ENV MAILDEV_WEB_PORT=80 \
    MAILDEV_SMTP_PORT=25

EXPOSE 25 80

COPY rootfs /

CMD [ "maildev" ]
