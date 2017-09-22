FROM webuni/nginx:1.12
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add \
        nginx-mod-http-geoip \
        nginx-mod-http-image-filter \
        nginx-mod-http-redis2 \
        nginx-mod-http-xslt-filter \
        nginx-mod-stream-geoip \
    && rm -rf /var/cache/apk/* /tmp/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
