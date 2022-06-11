FROM minidocks/python AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=55.0

RUN apk add -u cairo cairo-gobject pango gdk-pixbuf py3-brotli py3-lxml py3-cffi py3-pillow msttcorefonts-installer fontconfig zopfli \
    && update-ms-fonts && fc-cache -f && clean

RUN pip install weasyprint==$version && clean

ADD rootfs /

CMD [ "weasyprint" ]
