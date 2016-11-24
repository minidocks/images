FROM webuni/perl:5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN printf "@main http://dl-cdn.alpinelinux.org/alpine/edge/main\n" >> /etc/apk/repositories \
    && printf "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing\n" >> /etc/apk/repositories \
    && printf "@community http://dl-cdn.alpinelinux.org/alpine/edge/community\n" >> /etc/apk/repositories \
    && apk --update add \
        texlive-luatex@testing \
        zziplib@community \
        poppler@main \
        poppler-utils@main \
    && rm -rf /var/cache/apk/* /tmp/*
