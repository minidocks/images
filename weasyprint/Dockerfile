FROM minidocks/python:3-build AS build

RUN apk add zopfli-dev \
    && pip3 wheel --wheel-dir=/tmp zopfli

FROM minidocks/python:3 AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=53.4

RUN apk add --update cairo cairo-gobject pango gdk-pixbuf py3-brotli py3-lxml py3-cffi py3-pillow msttcorefonts-installer fontconfig zopfli \
    && update-ms-fonts && fc-cache -f && clean

COPY --from=build /tmp/zopfli* /tmp

RUN pip install /tmp/zopfli* weasyprint==$version && clean

ADD rootfs /

CMD [ "weasyprint" ]
