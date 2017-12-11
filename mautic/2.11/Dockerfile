FROM webuni/php:7.1-intl
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV MAUTIC_VERSION 2.11.0

RUN apk add --update php7-imap php7-mailparse php7-xmlwriter nginx git \
    && mkdir -p /var/www/.git/hooks && wget -O /var/www/mautic.tar.gz "https://github.com/mautic/mautic/archive/${MAUTIC_VERSION}.tar.gz" \
    && tar -xvzf /var/www/mautic.tar.gz -C /var/www && cp -a /var/www/mautic*/* /var/www && rm -rf /var/www/mautic* \
    && cd /var/www && composer install --prefer-dist --no-dev --optimize-autoloader \
    && chown -R www-data:www-data /var/www \
    && apk del git && rm -rf /var/cache/apk/* /tmp/* /composer/cache

WORKDIR /var/www

COPY rootfs /

CMD [ "supervise", "crond", "php-fpm", "nginx" ]
