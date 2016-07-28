FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk --update add texlive poppler-utils \
    && rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT [ "docker-exec" ]
