FROM webuni/ghostscript:9
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add imagemagick6 \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "convert" ]
