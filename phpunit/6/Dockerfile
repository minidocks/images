FROM minidocks/php:7.1-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add --update php7-xml php7-dom php7-soap php7-xmlwriter php7-xdebug \
    && su-exec user composer global require phpunit/phpunit "6.*"  \
    && rm -rf /var/cache/apk/* /composer/cache

ENV PHP_MEMORY_LIMIT -1

COPY rootfs /

CMD [ "phpunit" ]
