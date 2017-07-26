FROM webuni/php:5.6-base
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add \
        php5-apcu \
        php5-bcmath \
        php5-ctype \
        php5-dom \
        php5-exif \
        php5-fpm \
        php5-ftp \
        php5-gd \
        php5-gettext \
        php5-mcrypt \
        php5-opcache \
        php5-pdo_sqlite \
        php5-pdo_mysql \
        php5-pdo_pgsql \
        php5-soap \
        php5-sockets \
        php5-xdebug \
        php5-xml \
        php5-xsl \
        php5-zip \
    && sed -i "s/^[; ]*\(zend_extension\|extension\)/;\1/" "$PHP_INI_DIR/conf.d/xdebug.ini" \
    && rm -rf /var/cache/apk/* /tmp/*

ENV PHP_EXT_XDEBUG=0 \
    FPM_DAEMONIZE=no \
    FPM_WWW_LISTEN="[::]:9000" \
    FPM_WWW_CLEAR_ENV=no \
    FPM_WWW_USER=www-data \
    FPM_WWW_GROUP=www-data \
    BLACKFIRE_VERSION=1.17.3

RUN wget -O /usr/lib/php5/modules/blackfire.so https://packages.blackfire.io/binaries/blackfire-php/${BLACKFIRE_VERSION}/blackfire-php-alpine_amd64-php-56.so \
    && mkdir /var/run/blackfire \
    && chmod a+x /var/run/blackfire/ /usr/lib/php5/modules/blackfire.so \
    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php5/conf.d/blackfire.ini

COPY rootfs /

EXPOSE 9000
