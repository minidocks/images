FROM webuni/perl:5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN printf "http://dl-cdn.alpinelinux.org/alpine/edge/main\n" >> /etc/apk/repositories \
    && printf "http://dl-cdn.alpinelinux.org/alpine/edge/testing\n" >> /etc/apk/repositories \
    && apk --update add texlive-luatex \
    && rm -rf /var/cache/apk/* /tmp/*
