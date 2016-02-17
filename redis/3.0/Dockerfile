# Dockerfile is based on https://github.com/docker-library/postgres/blob/master/9.5
FROM webuni/alpine-base:3.3

RUN addgroup -S redis && adduser -S -G redis redis

RUN apk --update add redis \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /data && chown redis:redis /data

VOLUME /data
WORKDIR /data

COPY docker-entrypoint.sh /

ENTRYPOINT "/docker-entrypoint.sh"

EXPOSE 6379

CMD [ "redis-server" ]
