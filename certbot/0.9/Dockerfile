FROM webuni/python:2.7
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

RUN apk --update add certbot \
    && rm -rf /var/cache/apk/* /tmp/* && find /usr/lib/python2.7 -name '*.pyc' -delete

COPY rootfs /

CMD [ "certbot" ]
