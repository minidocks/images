FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=3.3.0

RUN apk --update add py3-crypto py3-paramiko py3-yaml py3-jinja2 py3-markupsafe \
    && pip install ansible==$version ansible-lint[yamllint] virtualenv docker \
    && clean

COPY rootfs /

CMD [ "ansible" ]
