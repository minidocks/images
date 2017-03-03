FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN addgroup -S nginx && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx

RUN apk --update add nginx \
    && rm -rf /var/cache/apk/* /tmp/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY rootfs /

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off; pid /var/run/nginx.pid;"]

# https://github.com/nginxinc/docker-nginx/blob/master/stable/alpine/Dockerfile
