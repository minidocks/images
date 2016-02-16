FROM webuni/php:5.6-composer
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add php-ctype php-opcache php-mcrypt php-iconv php-xml php-dom php-gd \
        php-sockets php-pdo_sqlite php-pdo_mysql php-pdo_pgsql php-curl php-pcntl \
    && rm -rf /var/cache/apk/* /tmp/*

ENTRYPOINT ["php"]
