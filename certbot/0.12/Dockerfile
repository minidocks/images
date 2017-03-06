FROM webuni/python:2.7
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

RUN printf "http://dl-cdn.alpinelinux.org/alpine/edge/community\n" >> /etc/apk/repositories \
    && apk --update add certbot \
    && rm -rf /var/cache/apk/* /tmp/* && find /usr/lib/python2.7 -name '*.pyc' -delete

COPY rootfs /

VOLUME /etc/letsencrypt
VOLUME /var/lib/letsencrypt

CMD [ "certbot" ]
