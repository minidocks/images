FROM webuni/imagemagick:6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add inkscape \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "inkscape" ]
