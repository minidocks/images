FROM webuni/php:7.0-base
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add \
        php7-bcmath \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-exif \
        php7-fpm \
        php7-ftp \
        php7-gd \
        php7-gettext \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-session \
        php7-soap \
        php7-sockets \
        php7-xdebug \
        php7-xml \
        php7-xsl \
        php7-zip \
    && ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm \
    && rm -rf /var/cache/apk/* /tmp/*

ENV PHP_EXT_XDEBUG=0 \
    FPM_DAEMONIZE=no \
    FPM_WWW_LISTEN="[::]:9000" \
    FPM_WWW_CLEAR_ENV=no

# https://blackfire.io/api/v1/releases/probe/php/linux/amd64/70
#RUN wget -O /usr/lib/php7/modules/blackfire.so https://packages.blackfire.io/binaries/blackfire-php/1.10.6/blackfire-php-linux_amd64-php-70.so \
#    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php7/conf.d/blackfire.ini

COPY rootfs /

EXPOSE 9000
