FROM webuni/php:7.0-composer
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN echo http://dl-4.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk --update add php7-ctype php7-bcmath php7-opcache php7-mcrypt php7-mbstring php7-xml php7-dom php7-gd \
        php7-sockets php7-pdo_sqlite php7-pdo_mysql php7-mysqlnd php7-pdo_pgsql php7-curl php7-pcntl php7-session \
        php7-xdebug \
    && rm -rf /var/cache/apk/* /tmp/*

# https://blackfire.io/api/v1/releases/probe/php/linux/amd64/70
#RUN wget -O /usr/lib/php7/modules/blackfire.so https://packages.blackfire.io/binaries/blackfire-php/1.10.6/blackfire-php-linux_amd64-php-70.so \
#    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > /etc/php7/conf.d/blackfire.ini

RUN wget http://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

EXPOSE 8707
EXPOSE 9000
