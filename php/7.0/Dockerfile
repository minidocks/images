FROM webuni/php:7.0-base
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV PHP_EXT_XDEBUG=0

RUN printf "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing\n" >> /etc/apk/repositories \
    && apk --update add \
        php7-apcu@testing \
        php7-bcmath@community \
        php7-ctype@community \
        php7-dom@community \
        php7-exif@community \
        php7-ftp@community \
        php7-gd@community \
        php7-gettext@community \
        php7-mbstring@community \
        php7-mcrypt@community \
        php7-mysqlnd@community \
        php7-opcache@community \
        php7-pdo_mysql@community \
        php7-pdo_pgsql@community \
        php7-pdo_sqlite@community \
        php7-session@community \
        php7-soap@community \
        php7-sockets@community \
        php7-xdebug@community \
        php7-xml@community \
        php7-xsl@community \
        php7-zip@community \
    && rm -rf /var/cache/apk/* /tmp/*

# https://blackfire.io/api/v1/releases/probe/php/linux/amd64/70
#RUN wget -O /usr/lib/php7/modules/blackfire.so https://packages.blackfire.io/binaries/blackfire-php/1.10.6/blackfire-php-linux_amd64-php-70.so \
#    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php7/conf.d/blackfire.ini

EXPOSE 9000
