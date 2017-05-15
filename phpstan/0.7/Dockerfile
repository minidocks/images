FROM webuni/php:7.1-base
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk add --update php7-mbstring php7-pdo php7-xml \
    && su-exec user composer global require phpstan/phpstan-shim phpstan/phpstan-doctrine  \
    && rm -rf /var/cache/apk/* /composer/cache

ENV PHP_MEMORY_LIMIT -1

COPY rootfs /

CMD [ "phpstan" ]
