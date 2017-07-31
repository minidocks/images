FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV PHP_INI_DIR=/etc/php7 \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer \
    COMPOSER_CACHE_DIR="$COMPOSER_HOME/cache \
    PATH="$COMPOSER_HOME/vendor/bin:$PATH"

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

RUN apk --update add \
        "php7<7.1" \
        php7-apcu \
        php7-ctype \
        php7-curl \
        php7-iconv \
        php7-json \
        php7-mbstring \
        php7-openssl \
        php7-pcntl \
        php7-pear \
        php7-phar \
        php7-posix \
        php7-zlib \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && ln -s /usr/bin/phpize7 /usr/bin/phpize \
    && rm -rf /var/cache/apk/* /tmp/*

#Psysh
RUN wget http://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

RUN mkdir -p /app /composer && chown www-data:www-data /app /composer && chmod a+rwx /composer

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && su-exec user composer global require hirak/prestissimo webuni/composer-yaml-plugin webuni/composer-neon-plugin \
    && rm -rf /composer/cache

WORKDIR /app

COPY rootfs /

CMD [ "psysh", "-c", "/etc/psysh" ]
