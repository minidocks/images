FROM minidocks/librsvg
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add inkscape potrace msttcorefonts-installer fontconfig \
    && update-ms-fonts && fc-cache -f && clean

COPY rootfs /

CMD [ "inkscape" ]
