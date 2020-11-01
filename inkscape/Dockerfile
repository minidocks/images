FROM minidocks/librsvg
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG repository

RUN apk --update add "inkscape$repository" potrace msttcorefonts-installer fontconfig \
    && update-ms-fonts && fc-cache -f && clean

COPY rootfs /

CMD [ "inkscape" ]
