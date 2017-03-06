FROM webuni/python:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add py3-psycopg2 py3-six py3-setproctitle \
    && pip install pgcli \
    && rm -rf /var/cache/apk/* /root/.cache/pip && find /usr/lib/python3.5 -name '*.pyc' -delete

ADD rootfs /

CMD [ "pgcli" ]
