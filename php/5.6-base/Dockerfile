FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV PHP_INI_DIR /etc/php5
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

RUN apk --update add \
        "php5>=5.6" \
        php5-curl \
        php5-iconv \
        php5-json \
        php5-openssl \
        php5-pcntl \
        php5-phar \
        php5-posix \
        readline \
    && rm -rf /var/cache/apk/* /tmp/*

#Psysh
RUN wget http://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

RUN mkdir -p /app /composer && chown www-data:www-data /app /composer

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && su-exec user composer global require hirak/prestissimo webuni/composer-yaml-plugin \
    && rm -rf /composer/cache

WORKDIR /app

COPY rootfs /

CMD [ "psysh", "-c", "/etc/psysh" ]

# https://github.com/docker-library/php/blob/master/5.6/alpine/Dockerfile
