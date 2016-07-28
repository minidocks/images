FROM webuni/python:2.7
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN addgroup -S ansible && adduser -S -G ansible ansible

ENV ANSIBLE_VERSION 2.1

RUN apk --update add ca-certificates py-cffi py-paramiko py-yaml py-jinja2 \
    && pip install ansible==$ANSIBLE_VERSION \
    && rm -rf /var/cache/apk/* /tmp/*

COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "ansible" ]
