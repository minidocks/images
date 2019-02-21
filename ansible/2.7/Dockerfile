FROM minidocks/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV ANSIBLE_VERSION 2.7.6

RUN apk --update add py3-crypto py3-paramiko py3-yaml py3-jinja2 py3-markupsafe \
    && pip install ansible==$ANSIBLE_VERSION \
    && clean

COPY rootfs /

CMD [ "ansible" ]
