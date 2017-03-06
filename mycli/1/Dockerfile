FROM webuni/python:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add py3-crypto py3-six \
    && pip install mycli \
    && rm -rf /var/cache/apk/* /root/.cache/pip && find /usr/lib/python3.5 -name '*.pyc' -delete

ADD rootfs /

CMD [ "mycli" ]
