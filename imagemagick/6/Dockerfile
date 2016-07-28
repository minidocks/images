FROM webuni/ghostscript:9
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add imagemagick \
    && rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT [ "docker-exec" ]

CMD [ "convert" ]
