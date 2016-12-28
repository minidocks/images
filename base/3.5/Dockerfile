FROM alpine:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV TEMP /tmp

RUN adduser -u 1000 -D -S -G users user

RUN apk --update add busybox-suid su-exec tini runit inotify-tools dropbear dropbear-scp libressl ca-certificates \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /etc/dropbear /etc/runit

ADD rootfs /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
