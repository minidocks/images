FROM alpine:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV TEMP /tmp \
    ENV=/etc/profile \
    CLEAN="/var/cache/apk/:/tmp/"

RUN adduser -u 1000 -S -s /bin/sh -G users user

COPY rootfs /

RUN apk --update add busybox-suid su-exec tini monit inotify-tools dropbear dropbear-scp dropbear-dbclient dropbear-convert libressl ca-certificates gettext libintl \
    && mv /usr/bin/envsubst /usr/local/bin/ \
    && apk del gettext && clean

RUN chmod 600 /etc/monitrc

ENTRYPOINT [ "/docker-entrypoint.sh" ]
