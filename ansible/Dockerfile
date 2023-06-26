FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG ansible_package=ansible

RUN apk add py3-crypto py3-paramiko py3-yaml py3-jinja2 py3-markupsafe py3-ruamel.yaml \
    && pip install $ansible_package ansible-lint[yamllint] virtualenv docker \
    && clean

COPY rootfs /

CMD [ "ansible" ]
