FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add git git-subtree bash \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "git" ]
