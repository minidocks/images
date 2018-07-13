FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV WEASYPRINT_VERSION=0.42.3

RUN apk add --update cairo cairo-gobject pango gdk-pixbuf py3-lxml py3-cffi py3-pillow \
    && pip install weasyprint==$WEASYPRINT_VERSION \
    && rm -rf /var/cache/apk/* /tmp/* $PIP_CACHE_DIR/* && pyclean

ADD rootfs /

CMD [ "weasyprint" ]
