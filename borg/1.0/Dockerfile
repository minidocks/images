FROM webuni/python:3.5
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

ENV BORG_VERSION=1.0.10

RUN apk add --update lz4 acl py3-msgpack \
    && apk add --virtual build-dependencies gcc musl-dev acl-dev python3-dev lz4-dev libressl-dev \
    && pip install -U borgbackup==${BORG_VERSION} \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/* /root/.cache/pip && find /usr/lib/python3.5 -name '*.pyc' -delete

COPY rootfs /

CMD [ "borg" ]
