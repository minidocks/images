FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN addgroup -S mongodb && adduser -S -G mongodb mongodb

RUN echo http://dl-5.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk add --update mongodb \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir -p /data/db /data/configdb \
    && chown -R mongodb:mongodb /data/db /data/configdb

VOLUME /data/db /data/configdb

COPY rootfs /

EXPOSE 27017

CMD ["mongod"]
