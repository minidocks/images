FROM webuni/base:3.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN addgroup -S nginx && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx

RUN apk --update add nginx \
        nginx-mod-http-echo \
        nginx-mod-http-fancyindex \
        nginx-mod-http-headers-more \
        nginx-mod-http-lua \
        nginx-mod-http-lua-upstream \
        nginx-mod-http-nchan \
        nginx-mod-http-set-misc \
        nginx-mod-http-upload-progress \
        nginx-mod-mail \
        nginx-mod-rtmp \
        nginx-mod-stream \
    && rm -rf /var/cache/apk/* /tmp/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY rootfs /

EXPOSE 80

CMD ["nginx", "-g", "daemon off; pid /var/run/nginx.pid;"]

# https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine/Dockerfile
