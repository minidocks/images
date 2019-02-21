FROM minidocks/base:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S redis && adduser -S -G redis redis

RUN apk --update add 'redis<3.3' \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /data && chown redis:redis /data

VOLUME /data
WORKDIR /data

COPY rootfs /

EXPOSE 6379

CMD [ "redis-server" ]

# Dockerfile is based on https://github.com/docker-library/redis/blob/master/3.2/alpine/Dockerfile
