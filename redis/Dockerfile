FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S redis && adduser -S -G redis redis

ARG constraint=''

RUN apk --update add "redis$constraint" && clean

RUN mkdir /data && chown redis:redis /data

VOLUME /data
WORKDIR /data

COPY rootfs /

EXPOSE 6379

CMD [ "redis-server" ]
