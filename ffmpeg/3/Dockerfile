FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add ffmpeg \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "ffmpeg" ]
