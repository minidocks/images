FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S redis && adduser -S -G redis redis

ARG constraint=''

RUN apk --update add "redis$constraint" && clean

RUN mkdir /data && chown redis:redis /data

VOLUME /data
WORKDIR /data

COPY rootfs /

ENV REDIS_PROTECTED__MODE=no \
    REDIS_BIND=0.0.0.0

RUN /docker-entrypoint.sh

EXPOSE 6379

CMD [ "redis-server", "/etc/redis.conf" ]
