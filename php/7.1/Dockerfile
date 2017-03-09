FROM webuni/php:7.1-base
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN printf "http://dl-cdn.alpinelinux.org/alpine/edge/main\n" >> /etc/apk/repositories \
    && printf "http://dl-cdn.alpinelinux.org/alpine/edge/community\n" >> /etc/apk/repositories \
    && apk --update add \
        php7.1-bcmath \
        php7.1-ctype \
        php7.1-curl \
        php7.1-dom \
        php7.1-exif \
        php7.1-fileinfo \
        php7.1-fpm \
        php7.1-ftp \
        "libpng=1.6.25-r0" php7.1-gd \
        php7.1-gettext \
        php7.1-mbstring \
        php7.1-mcrypt \
        php7.1-mysqlnd \
        php7.1-opcache \
        php7.1-pdo_mysql \
        php7.1-pdo_pgsql \
        php7.1-pdo_sqlite \
        php7.1-session \
        php7.1-soap \
        php7.1-sockets \
        #php7.1-xdebug \
        php7.1-xml \
        php7.1-xsl \
        php7.1-zip \
    && ln -s /usr/sbin/php-fpm7.1 /usr/bin/php-fpm \
    && rm -rf /var/cache/apk/* /tmp/*

ENV PHP_EXT_XDEBUG=0 \
    FPM_PID=run/php-fpm.pid \
    FPM_DAEMONIZE=no \
    FPM_WWW_LISTEN="[::]:9000" \
    FPM_WWW_CLEAR_ENV=no \
    FPM_WWW_USER=www-data \
    FPM_WWW_GROUP=www-data
#    BLACKFIRE_VERSION=1.14.3

# https://blackfire.io/api/v1/releases/probe/php/linux/amd64/70
#RUN wget -O /usr/lib/php7/modules/blackfire.so "https://packages.blackfire.io/binaries/blackfire-php/${BLACKFIRE_VERSION}/blackfire-php-linux_amd64-php-70.so" \
#    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php7/conf.d/blackfire.ini

COPY rootfs /

EXPOSE 9000
