FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=47

RUN apk add --update cairo cairo-gobject pango gdk-pixbuf py3-lxml py3-cffi py3-pillow msttcorefonts-installer fontconfig \
    && update-ms-fonts && fc-cache -f \
    && pip install weasyprint==$version \
    && clean

ADD rootfs /

CMD [ "weasyprint" ]
