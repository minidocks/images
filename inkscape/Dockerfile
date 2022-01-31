FROM minidocks/imagemagick:6 AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

RUN apk add inkscape poppler-utils potrace msttcorefonts-installer fontconfig && update-ms-fonts && fc-cache -f && clean

COPY rootfs /

CMD [ "inkscape" ]
