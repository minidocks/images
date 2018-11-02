FROM webuni/poppler
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add inkscape msttcorefonts-installer fontconfig \
    && update-ms-fonts && fc-cache -f \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "inkscape" ]
