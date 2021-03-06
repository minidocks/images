ARG version=8.0
ARG major=8
ARG composer1_version=1.10.20
ARG composer2_version=2.0.11
ARG blackfire_version=1.51.0

FROM minidocks/base:3.9 AS v7.2

FROM minidocks/base:3.12 AS v7.3

FROM minidocks/base:3.13 AS v7.4

FROM minidocks/base:3.13 AS v8.0

FROM v$version AS base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ARG major

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -S -s /bin/sh -G www-data www-data

RUN for module in ctype curl iconv json mbstring openssl pcntl pecl-apcu phar posix tokenizer; do modules="$modules php$major-$module"; done \
    && if [ "$version" == "7.2" ]; then libiconv_version="@community"; fi \
    && apk add "gnu-libiconv$libiconv_version" "php$major" $modules && clean \
    && if [ ! -f /usr/bin/php ]; then ln -s "/usr/bin/php$major" /usr/bin/php; fi

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

#Psysh
RUN wget https://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

ENV PHP_INI_DIR=/etc/php$major \
    PHP_ERROR_LOG=/dev/stderr.pipe \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer \
    COMPOSER_CACHE_DIR=/composer-cache \
    COMPOSER_HTACCESS_PROTECT=0 \
    COMPOSER_MEMORY_LIMIT=-1 \
    CLEAN="$CLEAN:\$COMPOSER_CACHE_DIR/"

ARG composer1_version
ARG composer2_version

RUN mkdir -p /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chown www-data:www-data /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chmod a+rwx "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR"

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer1.phar --version="$composer1_version" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer --version="$composer2_version" \
    && php -r "unlink('composer-setup.php');" \
    && clean

COPY rootfs /

CMD [ "psysh", "-c", "/etc/psysh" ]

FROM base AS latest

ARG version
ARG major

RUN for module in \
        bcmath \
        calendar \
        cgi \
        dom \
        exif \
        fileinfo \
        fpm \
        ftp \
        gd \
        gettext \
        gmp \
        ldap \
        mysqli \
        mysqlnd \
        opcache \
        pecl-mcrypt \
        pecl-redis \
        pecl-xdebug \
        pdo_mysql \
        pdo_pgsql \
        pdo_sqlite \
        pgsql \
        session \
        simplexml \
        soap \
        sockets \
        sodium \
        sqlite3 \
        xml \
        xmlreader \
        xmlwriter \
        xsl \
        zip \
    ; do modules="$modules php$major-$module"; done \
    && if [ "$major" != "8" ]; then modules="$modules php$major-xmlrpc"; fi \
    && apk add $modules \
    && if [ ! -f /usr/bin/php-fpm ]; then ln -s "/usr/sbin/php-fpm$major" /usr/bin/php-fpm; fi \
    && clean

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
    PHP_XDEBUG__REMOTE_ENABLE=1 \
    PHP_XDEBUG__REMOTE_HOST=172.17.0.1 \
    PHP_XDEBUG__REMOTE_PORT=9000 \
    PHP_XDEBUG__REMOTE_CONNECT_BACK=0 \
    PHP_XDEBUG__IDEKEY=PHPSTORM \
    RAWEXEC="$RAWEXEC php-fpm php-fpm$major"

ARG blackfire_version

# Blackfire
RUN wget -O "/usr/lib/php${major}/modules/blackfire.so" https://packages.blackfire.io/binaries/blackfire-php/${blackfire_version}/blackfire-php-alpine_amd64-php-${version/./}.so \
    && mkdir /var/run/blackfire \
    && chmod a+x /var/run/blackfire/ "/usr/lib/php${major}/modules/blackfire.so" \
    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > "${PHP_INI_DIR}/conf.d/blackfire.ini"

EXPOSE 9000

FROM latest AS nginx

RUN apk add nginx && clean

# Fix https://gitlab.alpinelinux.org/alpine/aports/-/issues/9364
RUN chmod 1777 /var/lib/nginx/tmp

FROM nginx AS intl

ARG major

RUN apk add "php$major-intl" && clean

FROM latest
