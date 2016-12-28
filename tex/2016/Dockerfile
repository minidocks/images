FROM webuni/perl:5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN printf "@main http://dl-cdn.alpinelinux.org/alpine/edge/main\n" >> /etc/apk/repositories \
    && printf "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing\n" >> /etc/apk/repositories \
    && apk --update add icu-libs@main texlive-luatex@testing \
    && rm -rf /var/cache/apk/* /tmp/*
