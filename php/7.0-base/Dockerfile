FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV PHP_INI_DIR /etc/php7
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

RUN printf "@community http://dl-cdn.alpinelinux.org/alpine/edge/community\n" >> /etc/apk/repositories \
    && printf "@main http://dl-cdn.alpinelinux.org/alpine/edge/main\n" >> /etc/apk/repositories \
    && apk --update add \
        "php7@community<7.1" \
        php7-curl@community \
        php7-iconv@community \
        php7-json@community \
        libressl@main \
        php7-openssl@community \
        php7-pcntl@community \
        php7-phar@community \
        php7-posix@community \
        php7-zlib@community \
    && ln -s /usr/bin/php7 /usr/bin/php \
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
