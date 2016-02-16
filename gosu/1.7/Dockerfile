FROM alpine:3.3
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk --update add gosu \
    && sed -i '$ d' /etc/apk/repositories \
    && rm -rf /var/cache/apk/*

