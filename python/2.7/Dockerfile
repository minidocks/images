FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add "python<3.0" py-pip \
    && rm -rf /var/cache/apk/* && find /usr/lib/python2.7 -name '*.pyc' -delete

RUN pip install -U pip virtualenv \
    && rm -rf /root/.cache/pip && find /usr/lib/python2.7 -name '*.pyc' -delete

COPY rootfs /

CMD [ "python" ]
