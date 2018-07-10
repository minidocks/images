FROM webuni/openssh:7
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add rsync \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /
