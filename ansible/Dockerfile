FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=2.10.5

RUN apk --update add py3-crypto py3-paramiko py3-yaml py3-jinja2 py3-markupsafe \
    && pip install ansible==$version virtualenv docker \
    && clean

COPY rootfs /

CMD [ "ansible" ]
