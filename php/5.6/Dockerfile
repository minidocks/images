FROM webuni/php:5.6-base
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV PHP_EXT_XDEBUG=0

RUN apk --update add \
        php5-apcu \
        php5-bcmath \
        php5-ctype \
        php5-dom \
        php5-exif \
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
        php5-zlib \
    && sed -i "s/^[; ]*\(zend_extension\|extension\)/;\1/" "$PHP_INI_DIR/conf.d/xdebug.ini" \
    && rm -rf /var/cache/apk/* /tmp/*

ENV BLACKFIRE_VERSION=1.13.0

# https://blackfire.io/api/v1/releases/probe/php/linux/amd64/56
#RUN wget -O /usr/lib/php5/modules/blackfire.so https://packages.blackfire.io/binaries/blackfire-php/${BLACKFIRE_VERSION}/blackfire-php-linux_amd64-php-56.so \
#    && chmod a+x /usr/lib/php5/modules/blackfire.so \
#    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php5/conf.d/blackfire.ini

EXPOSE 9000
