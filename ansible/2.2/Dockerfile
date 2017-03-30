FROM webuni/python:2.7
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV ANSIBLE_VERSION 2.2.2

RUN apk --update add py-cffi py-paramiko py-yaml py-jinja2 \
    && pip install ansible==$ANSIBLE_VERSION ansible-container \
    && rm -rf /var/cache/apk/* && find /usr/lib/python2.7 -name '*.pyc' -delete

COPY rootfs /

CMD [ "ansible" ]
