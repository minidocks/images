FROM minidocks/php:5.6-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN printf "@3.5-community http://dl-cdn.alpinelinux.org/alpine/v3.5/community\n" >> /etc/apk/repositories \
    && apk --update add \
        php5-apcu \
        php5-bcmath \
        php5-calendar \
        php5-cgi \
        php5-dom \
        php5-exif \
        php5-fpm \
        php5-ftp \
        php5-gd \
        php5-gettext \
        php5-gmp \
        php5-ldap \
        php5-mcrypt \
        php5-opcache \
        php5-pdo_sqlite \
        php5-pdo_mysql \
        php5-pdo_pgsql \
        php5-soap \
        php5-sockets \
        "php5-xdebug@3.5-community" \
        php5-xml \
        php5-xmlreader \
        php5-xmlrpc \
        #php5-xmlwriter \
        php5-xsl \
        php5-zip \
    && ln -s /usr/bin/php-fpm5 /usr/bin/php-fpm \
    && sed -i "s/^[; ]*\(zend_extension\|extension\)/;\1/" "$PHP_INI_DIR/conf.d/xdebug.ini" \
    && rm -rf /var/cache/apk/* /tmp/*

ENV PHP_EXT_XDEBUG=0 \
    FPM_DAEMONIZE=no \
    FPM_ERROR_LOG=/dev/stderr.pipe \
    FPM_WWW_ACCESS__LOG=/dev/stdout.pipe \
    FPM_WWW_CATCH_WORKERS_OUTPUT=yes \
    FPM_WWW_CLEAR_ENV=no \
    FPM_WWW_GROUP=www-data \
    FPM_WWW_LISTEN="[::]:9000" \
    FPM_WWW_USER=www-data \
    FPM_WWW_SLOWLOG=/dev/stdout.pipe \
    PHP_XDEBUG__REMOTE_ENABLE=1 \
    PHP_XDEBUG__REMOTE_HOST=172.17.0.1 \
    PHP_XDEBUG__REMOTE_PORT=9000 \
    PHP_XDEBUG__REMOTE_CONNECT_BACK=0 \
    PHP_XDEBUG__IDEKEY=PHPSTORM \
    BLACKFIRE_VERSION=1.24.3

RUN wget -O /usr/lib/php5/modules/blackfire.so https://packages.blackfire.io/binaries/blackfire-php/${BLACKFIRE_VERSION}/blackfire-php-alpine_amd64-php-56.so \
    && mkdir /var/run/blackfire \
    && chmod a+x /var/run/blackfire/ /usr/lib/php5/modules/blackfire.so \
    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php5/conf.d/blackfire.ini

EXPOSE 9000
