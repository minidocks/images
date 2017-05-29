FROM alpine:3.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV TEMP /tmp

RUN adduser -u 1000 -D -S -G users user

RUN apk --update add busybox-suid su-exec tini monit inotify-tools dropbear dropbear-scp dropbear-dbclient dropbear-convert libressl ca-certificates make \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /etc/dropbear /etc/monit.d

COPY rootfs /

RUN chmod 600 /etc/monitrc

EXPOSE 2812

ENTRYPOINT [ "/docker-entrypoint.sh" ]
