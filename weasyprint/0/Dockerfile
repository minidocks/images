FROM webuni/python:3.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV WEASYPRINT_VERSION=0.40

RUN apk add --update cairo cairo-gobject pango gdk-pixbuf py3-lxml py3-cffi py3-pillow \
    && pip install weasyprint==$WEASYPRINT_VERSION \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache/pip && find /usr/lib/python3.6 -name '*.pyc' -delete

ADD rootfs /

CMD [ "weasyprint" ]
