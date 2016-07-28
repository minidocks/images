FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN addgroup -S redis && adduser -S -G redis redis

RUN apk --update add 'redis<3.3' \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir /data && chown redis:redis /data

VOLUME /data
WORKDIR /data

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 6379

CMD [ "redis-server" ]

# Dockerfile is based on https://github.com/docker-library/redis/blob/master/3.2/alpine/Dockerfile
