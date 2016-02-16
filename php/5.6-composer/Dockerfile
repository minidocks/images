FROM alpine:3.3
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add ca-certificates php-cli php-json php-phar php-openssl php-posix \
    && php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin --filename=composer \
    && rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT ["composer"]
