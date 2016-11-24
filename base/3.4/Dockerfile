FROM alpine:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV TEMP /tmp

RUN adduser -u 1000 -D -S -G users user

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk --update add busybox-suid su-exec tini runit@community dropbear dropbear-scp openssl ca-certificates \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /etc/dropbear /etc/runit

ADD rootfs /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
