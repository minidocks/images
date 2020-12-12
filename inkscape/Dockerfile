ARG version=1

FROM minidocks/librsvg AS v0

FROM minidocks/imagemagick:6 AS v1

FROM v$version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

RUN apk del poppler poppler-utils \
    && if [ "$version" = "0" ]; then apk add 'inkscape@311<1' poppler-utils@311; else apk add inkscape@edge poppler-utils@edge; fi \
    && apk add potrace msttcorefonts-installer fontconfig \
    && update-ms-fonts && fc-cache -f && clean

COPY rootfs /

CMD [ "inkscape" ]
