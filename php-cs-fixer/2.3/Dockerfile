FROM minidocks/php:7.1-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add php7-ctype \
    && su-exec user composer global require friendsofphp/php-cs-fixer "2.3.*" \
    && rm -rf /var/cache/apk/* /composer/cache

ENV PHP_MEMORY_LIMIT -1

COPY rootfs /

CMD [ "php-cs-fixer" ]
