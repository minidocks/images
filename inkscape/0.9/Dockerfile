FROM webuni/imagemagick:6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add inkscape \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "inkscape" ]
