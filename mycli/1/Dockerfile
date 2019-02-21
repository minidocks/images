FROM minidocks/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV MYCLI_VERSION=v1.17.0

RUN apk --update add py3-cryptography \
    && pip install mycli==$MYCLI_VERSION \
    && rm -rf /var/cache/apk/* $PIP_CACHE_DIR/* && pyclean

ADD rootfs /

CMD [ "mycli" ]
