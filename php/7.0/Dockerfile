FROM webuni/php:7.0-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add \
        php7-bcmath \
        php7-calendar \
        php7-cgi \
        php7-curl \
        php7-dom \
        php7-exif \
        php7-fpm \
        php7-ftp \
        php7-gd \
        php7-gettext \
        php7-gmp \
        php7-ldap \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-redis \
        php7-session \
        php7-soap \
        php7-sockets \
        php7-xdebug \
        php7-xml \
        php7-xmlreader \
        php7-xmlrpc \
        #php7-xmlwriter \
        php7-xsl \
        php7-zip \
    && ln -s /usr/sbin/php-fpm7 /usr/bin/php-fpm \
    && rm -rf /var/cache/apk/* /tmp/*

ENV PHP_EXT_XDEBUG=0 \
    FPM_PID=run/php-fpm.pid \
    FPM_DAEMONIZE=no \
    FPM_ERROR_LOG=/dev/stderr.pipe \
    FPM_WWW_ACCESS__LOG=/dev/stdout.pipe \
    FPM_WWW_CATCH_WORKERS_OUTPUT=yes \
    FPM_WWW_CLEAR_ENV=no \
    FPM_WWW_GROUP=www-data \
    FPM_WWW_LISTEN="[::]:9000" \
    FPM_WWW_USER=www-data \
    FPM_WWW_SLOWLOG=/dev/stdout.pipe \
    BLACKFIRE_VERSION=1.24.3

RUN wget -O /usr/lib/php7/modules/blackfire.so https://packages.blackfire.io/binaries/blackfire-php/${BLACKFIRE_VERSION}/blackfire-php-alpine_amd64-php-70.so \
    && mkdir /var/run/blackfire \
    && chmod a+x /var/run/blackfire/ /usr/lib/php7/modules/blackfire.so \
    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php7/conf.d/blackfire.ini

EXPOSE 9000
