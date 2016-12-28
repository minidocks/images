FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add ffmpeg \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "ffmpeg" ]
