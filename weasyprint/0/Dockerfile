FROM webuni/python:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk add --update cairo cairo-gobject pango gdk-pixbuf py3-lxml py3-cffi py3-pillow \
    && pip install weasyprint \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache/pip && find /usr/lib/python3.5 -name '*.pyc' -delete

ADD rootfs /

CMD [ "weasyprint" ]
