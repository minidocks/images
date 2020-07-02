ARG version=7.4
ARG major=7
ARG composer_version=1.10.8
ARG blackfire_version=1.34.3

FROM minidocks/base:3.8 AS v5.6

FROM minidocks/base:3.7 AS v7.1

FROM minidocks/base:3.9 AS v7.2

FROM minidocks/base:3.12 AS v7.3

FROM minidocks/base:edge AS v7.4

FROM v$version AS base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ARG major

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -S -s /bin/sh -G www-data www-data

RUN for module in ctype curl iconv json openssl pcntl phar posix; do modules="$modules php$major-$module"; done \
    && if [ "$version" = "5.6" ]; then modules="$modules php5-cli"; fi \
    && if [ "$version" != "5.6" ]; then modules="$modules php7-mbstring"; fi \
    && if echo "7.0" | grep -q "$version"; then modules="$modules php7-zlib"; fi \
    && if echo "5.6 7.0" | grep -qv "$version"; then modules="$modules php7-tokenizer"; fi \
    && if echo "5.6 7.0 7.1" | grep -q "$version"; then modules="$modules php${major}-apcu"; else modules="$modules php7-pecl-apcu"; fi \
    && if echo "7.3 7.4" | grep -qv "$version"; then libiconv_version="@community"; fi \
    && apk add "gnu-libiconv$libiconv_version" "php$major" $modules && clean \
    && if [ ! -f /usr/bin/php ]; then ln -s "/usr/bin/php$major" /usr/bin/php; fi \
    && if [ ! -f /usr/bin/phpize ]; then ln -s "/usr/bin/phpize$major" /usr/bin/phpize; fi

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

ARG composer_version

RUN mkdir -p /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chown www-data:www-data /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chmod a+rwx "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR"

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer --version="$composer_version" \
    && php -r "unlink('composer-setup.php');" \
    && packages="webuni/composer-yaml-plugin webuni/composer-neon-plugin" \
    && if echo "5.6 7.0" | grep -qv "$version"; then packages="$packages localheinz/composer-normalize"; fi \
    && su-exec user composer global require $packages \
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
        fpm \
        ftp \
        gd \
        gettext \
        gmp \
        ldap \
        mysqli \
        opcache \
        pdo_mysql \
        pdo_pgsql \
        pdo_sqlite \
        pgsql \
        soap \
        sockets \
        sqlite3 \
        xml \
        xmlreader \
        xmlrpc \
        xsl \
        zip \
    ; do modules="$modules php${major}-$module"; done \
    && if [ "$version" = "5.6" ]; then modules="$modules php5-mysql php5-xdebug@35"; else modules="$modules php7-mysqlnd php7-session php7-xdebug"; fi \
    && if echo "5.6 7.0" | grep -qv "$version"; then modules="$modules php7-redis php7-fileinfo php7-simplexml php7-xmlwriter"; fi \
    && if echo "5.6 7.0 7.1" | grep -q "$version"; then modules="$modules php${major}-mcrypt"; else modules="$modules php7-pecl-mcrypt php7-sodium"; fi \
    && apk add $modules \
    && if [ ! -f /usr/bin/php-fpm ]; then ln -s "/usr/sbin/php-fpm${major}" /usr/bin/php-fpm; fi \
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
    PHP_XDEBUG__IDEKEY=PHPSTORM

ARG blackfire_version

RUN wget -O "/usr/lib/php${major}/modules/blackfire.so" https://packages.blackfire.io/binaries/blackfire-php/${blackfire_version}/blackfire-php-alpine_amd64-php-${version/./}.so \
    && mkdir /var/run/blackfire \
    && chmod a+x /var/run/blackfire/ "/usr/lib/php${major}/modules/blackfire.so" \
    && echo -e "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707" > "${PHP_INI_DIR}/conf.d/blackfire.ini"

EXPOSE 9000

FROM latest AS nginx

RUN apk add nginx nginx-mod-http-lua && clean

FROM nginx AS intl

ARG major

RUN apk add "php${major}-intl" && clean

FROM latest
