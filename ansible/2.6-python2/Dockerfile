FROM webuni/python:2.7
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV ANSIBLE_VERSION 2.6.4

RUN apk --update add py2-crypto py2-paramiko py2-yaml py2-jinja2 py2-markupsafe  \
    && pip install ansible==$ANSIBLE_VERSION \
    && rm -rf /var/cache/apk/* /tmp/* $PIP_CACHE_DIR/* && pyclean

COPY rootfs /

CMD [ "ansible" ]
