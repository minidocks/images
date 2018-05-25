FROM webuni/base:3.5
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

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

ENV PHP_INI_DIR=/etc/php7 \
    COMPOSER_VERSION="1.6.5" \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer \
    COMPOSER_CACHE_DIR=/composer-cache \
    COMPOSER_HTACCESS_PROTECT=0

RUN mkdir -p /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chown www-data:www-data /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chmod a+rwx "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR"

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer --version="$COMPOSER_VERSION" \
    && php -r "unlink('composer-setup.php');" \
    && su-exec user composer global require hirak/prestissimo webuni/composer-yaml-plugin webuni/composer-neon-plugin \
    && rm -rf $COMPOSER_CACHE_DIR/*

WORKDIR /var/www

COPY rootfs /

CMD [ "psysh", "-c", "/etc/psysh" ]
