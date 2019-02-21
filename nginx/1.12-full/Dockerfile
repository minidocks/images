FROM minidocks/nginx:1.12
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add \
        nginx-mod-http-image-filter \
        nginx-mod-http-xslt-filter \
    && rm -rf /var/cache/apk/* /tmp/*
