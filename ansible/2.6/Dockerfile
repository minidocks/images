FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV ANSIBLE_VERSION 2.6.4

RUN apk --update add py3-crypto py3-paramiko py3-yaml py3-jinja2 py3-markupsafe \
    && pip install ansible==$ANSIBLE_VERSION \
    && rm -rf /var/cache/apk/* /tmp/* $PIP_CACHE_DIR/* && pyclean

COPY rootfs /

CMD [ "ansible" ]
