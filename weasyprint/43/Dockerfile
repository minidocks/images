FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV WEASYPRINT_VERSION=43

RUN apk add --update cairo cairo-gobject pango gdk-pixbuf py3-lxml py3-cffi py3-pillow msttcorefonts-installer fontconfig \
    && update-ms-fonts && fc-cache -f \
    && pip install weasyprint==$WEASYPRINT_VERSION \
    && clean

ADD rootfs /

CMD [ "weasyprint" ]
