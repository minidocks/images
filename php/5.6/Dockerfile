FROM webuni/php:5.6-base
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV PHP_EXT_XDEBUG=0

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk --update add php5-ctype php5-bcmath php5-opcache php5-mcrypt php5-xml php5-dom php5-gd \
        php5-sockets php5-pdo_sqlite php5-pdo_mysql php5-pdo_pgsql php5-curl \
        php5-xdebug \
    && rm -rf /var/cache/apk/* /tmp/*

# https://blackfire.io/api/v1/releases/probe/php/linux/amd64/56
#RUN wget -O /usr/lib/php5/modules/blackfire.so https://packages.blackfire.io/binaries/blackfire-php/1.11.1/blackfire-php-linux_amd64-php-56.so \
#    && chmod a+x /usr/lib/php5/modules/blackfire.so \
#    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php5/conf.d/blackfire.ini

EXPOSE 9000
