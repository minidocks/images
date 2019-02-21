FROM minidocks/base:3.7
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S nginx && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx

RUN apk --update add nginx \
        nginx-mod-http-cache-purge \
        nginx-mod-http-echo \
        nginx-mod-http-fancyindex \
        nginx-mod-http-geoip \
        nginx-mod-http-headers-more \
        nginx-mod-http-lua \
        nginx-mod-http-lua-upstream \
        nginx-mod-http-nchan \
        nginx-mod-http-redis2 \
        nginx-mod-http-set-misc \
        nginx-mod-http-shibboleth \
        nginx-mod-http-upload-progress \
        nginx-mod-http-upstream-fair \
        nginx-mod-mail \
        nginx-mod-rtmp \
        nginx-mod-stream \
        nginx-mod-stream-geoip \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

EXPOSE 80

CMD ["nginx", "-g", "daemon off; pid /var/run/nginx.pid;"]

# https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine/Dockerfile
