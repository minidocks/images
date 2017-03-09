FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV PHP_INI_DIR /etc/php7.1
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $COMPOSER_HOME/vendor/bin:$PATH

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

RUN printf "http://dl-cdn.alpinelinux.org/alpine/edge/testing\n" >> /etc/apk/repositories \
    && apk --update add \
        php7.1 \
        #php7-apcu \
        php7.1-curl \
        php7.1-iconv \
        php7.1-json \
        php7.1-mbstring \
        php7.1-openssl \
        php7.1-pcntl \
        php7.1-phar \
        php7.1-posix \
        php7.1-zlib \
    && rm -rf /var/cache/apk/* /tmp/*

#Psysh
RUN wget http://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

RUN mkdir -p /app /composer && chown www-data:www-data /app /composer && chmod a+rwx /composer

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && su-exec user composer global require hirak/prestissimo webuni/composer-yaml-plugin \
    && rm -rf /composer/cache

WORKDIR /app

COPY rootfs /

CMD [ "psysh", "-c", "/etc/psysh" ]
