FROM alpine:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV TEMP /tmp

RUN apk --update add su-exec tini openssl ca-certificates && rm -rf /var/cache/apk/* /tmp/*

COPY docker-exec /usr/bin/
