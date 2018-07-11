FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV MYCLI_VERSION=v1.12.1

RUN apk --update add py3-cryptography \
    && pip install mycli==$MYCLI_VERSION \
    && rm -rf /var/cache/apk/* /root/.cache/pip && find /usr/lib/python3.6 -name '*.pyc' -delete

ADD rootfs /

CMD [ "mycli" ]
