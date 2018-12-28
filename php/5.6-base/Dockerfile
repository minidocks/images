FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

RUN apk --update add \
        php5 \
        php5-curl \
        php5-iconv \
        php5-json \
        php5-openssl \
        php5-pcntl \
        php5-pear \
        php5-phar \
        php5-posix \
    && ln -s /usr/bin/php5 /usr/bin/php \
    && ln -s /usr/bin/phpize5 /usr/bin/phpize \
    && clean

#Psysh
RUN wget http://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

ENV PHP_INI_DIR=/etc/php5 \
    PHP_ERROR_LOG=/dev/stderr.pipe \
    COMPOSER_VERSION="1.8.0" \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer \
    COMPOSER_CACHE_DIR=/composer-cache \
    COMPOSER_HTACCESS_PROTECT=0 \
    COMPOSER_MEMORY_LIMIT=-1 \
    CLEAN="$CLEAN:\$COMPOSER_CACHE_DIR/"

RUN mkdir -p /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chown www-data:www-data /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chmod a+rwx "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR"

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer --version="$COMPOSER_VERSION" \
    && php -r "unlink('composer-setup.php');" \
    && su-exec user composer global require webuni/composer-yaml-plugin webuni/composer-neon-plugin \
    && clean

WORKDIR /var/www

COPY rootfs /

CMD [ "psysh", "-c", "/etc/psysh" ]

# https://github.com/docker-library/php/blob/master/5.6/alpine/Dockerfile
