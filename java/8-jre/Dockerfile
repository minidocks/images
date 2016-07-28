FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add openjdk8-jre-base \
    && rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT [ "docker-exec" ]
