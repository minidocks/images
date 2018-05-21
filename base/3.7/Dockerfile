FROM alpine:3.7
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV TEMP /tmp

RUN adduser -u 1000 -D -S -G users user

RUN apk --update add busybox-extras busybox-suid su-exec tini monit inotify-tools dropbear dropbear-scp dropbear-dbclient dropbear-convert libressl ca-certificates gettext libintl \
    && mv /usr/bin/envsubst /usr/local/bin/envsubst \
    && apk del gettext && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /etc/dropbear /etc/monit.d

COPY rootfs /

RUN chmod 600 /etc/monitrc

ENTRYPOINT [ "/docker-entrypoint.sh" ]
