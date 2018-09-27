FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV PGCLI_VERSION=v1.11.0

RUN apk --update add py3-psycopg2 py3-setproctitle \
    && pip install pgcli==$PGCLI_VERSION \
    && rm -rf /var/cache/apk/* $PIP_CACHE_DIR/* && pyclean

ADD rootfs /

CMD [ "pgcli" ]
