FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV PGCLI_VERSION=v1.7.0

RUN apk --update add py3-psycopg2 py3-setproctitle \
    && pip install pgcli==$PGCLI_VERSION \
    && rm -rf /var/cache/apk/* /root/.cache/pip && find /usr/lib/python3.6 -name '*.pyc' -delete

ADD rootfs /

CMD [ "pgcli" ]
