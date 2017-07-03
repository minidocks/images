FROM webuni/openssh:7
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add rsync \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /
