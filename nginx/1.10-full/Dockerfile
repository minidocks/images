FROM webuni/nginx:1.10
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add \
        nginx-mod-http-fancyindex \
        nginx-mod-http-geoip \
        nginx-mod-http-headers-more \
        nginx-mod-http-image-filter \
        nginx-mod-http-nchan \
        nginx-mod-http-upload-progress \
        nginx-mod-http-xslt-filter \
        nginx-mod-mail \
        nginx-mod-rtmp \
        nginx-mod-stream \
    && rm -rf /var/cache/apk/* /tmp/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log
