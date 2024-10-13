ARG version=8.3
ARG major=8
ARG suffix=83
ARG newrelic_version=11.2.0.15

FROM minidocks/base:3.19 AS v8.1

FROM minidocks/base:3.20 AS v8.2

FROM minidocks/base:3.20 AS v8.3

FROM v$version AS base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ARG major
ARG suffix

# 82 is the standard uid/gid for "www-data" in Alpine
RUN getent group www-data >/dev/null || addgroup -g 82 -S www-data; getent passwd www-date >/dev/null || adduser -u 82 -S -s /bin/sh -G www-data www-data

RUN for module in ctype curl iconv json mbstring openssl pcntl pecl-apcu phar posix tokenizer; do modules="$modules php$suffix-$module"; done \
    && apk add "gnu-libiconv" "php$suffix" $modules && clean \
    && if [ ! -e /usr/bin/php ]; then ln -s "php$suffix" /usr/bin/php; fi \
    && ln -fs "phar$suffix" /usr/bin/phar \
    && if [ ! -e /etc/php$major ]; then ln -s "php$suffix" "/etc/php$major"; fi \
    && if [ ! -e /usr/lib/php$major ]; then ln -s "php$suffix" "/usr/lib/php$major"; fi

ENV LD_PRELOAD="/usr/lib/preloadable_libiconv.so php"

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

RUN mkdir -p /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chown www-data:www-data /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chmod a+rwx "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR"

# Composer
RUN php --version && wget -O composer-setup.php https://getcomposer.org/installer \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && clean

COPY rootfs /

CMD [ "psysh", "-c", "/etc/psysh" ]

FROM base AS latest

ARG version
ARG major
ARG suffix

RUN for module in \
        bcmath \
        calendar \
        cgi \
        dom \
        exif \
        ffi \
        fileinfo \
        fpm \
        ftp \
        gd \
        gettext \
        gmp \
        imap \
        ldap \
        mysqli \
        mysqlnd \
        opcache \
        pecl-apcu \
        pecl-memcached \
        pecl-mongodb \
        pecl-opentelemetry \
        pecl-pcov \
        pecl-uploadprogress \
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
    ; do modules="$modules php$suffix-$module"; done \
    && if [ "$suffix" != "84" ]; then modules="$modules php$suffix-pecl-protobuf"; fi \
    && if [ "$suffix" != "81" ]; then modules="$modules php$suffix-pecl-excimer@edge"; fi \
    && apk add $modules \
    && if [ ! -f /usr/bin/php-fpm ]; then ln -s "$(ls /usr/sbin/php-fpm* -1| head -1)" /usr/bin/php-fpm; fi \
    && clean

ENV FPM_DAEMONIZE=no \
    FPM_ERROR_LOG=/dev/stderr.pipe \
    FPM_PID=run/php-fpm.pid \
    FPM_WWW_ACCESS__LOG=/dev/stdout.pipe \
    FPM_WWW_CATCH_WORKERS_OUTPUT=yes \
    FPM_WWW_CLEAR_ENV=no \
    FPM_WWW_GROUP=www-data \
    FPM_WWW_LISTEN="[::]:9000" \
    FPM_WWW_USER=www-data \
    FPM_WWW_SLOWLOG=/dev/stdout.pipe \
    PHP_EXT_XDEBUG=0 \
    NEWRELIC_DAEMON__ADDRESS=newrelic:31339 \
    NEWRELIC_ENABLED=no \
    PHP_XDEBUG__LOG=/dev/stdout.pipe \
    PHP_XDEBUG__DISCOVER_CLIENT_HOST=true \
    PHP_XDEBUG__CLIENT_HOST=172.17.0.1 \
    PHP_XDEBUG__CLIENT_PORT=9003 \
    XDEBUG_MODE=develop,debug \
    RAWEXEC="$RAWEXEC php-fpm php-fpm$major"

ARG TARGETARCH

ARG newrelic_version

# NewRelic
RUN if [ "$TARGETARCH" = amd64 ]; then wget -O /tmp/nr.tar.gz "http://download.newrelic.com/php_agent/archive/${newrelic_version}/newrelic-php5-${newrelic_version}-linux-musl.tar.gz" \
    && tar -xzf /tmp/nr.tar.gz -C /tmp \
    && NR_INSTALL_SILENT=1 NR_INSTALL_USE_CP_NOT_LN=1 NR_INSTALL_INITFILE=/tmp/nr NR_INSTALL_DAEMONPATH=/tmp/nr-daemon /tmp/newrelic*/newrelic-install install \
    && rm -rf /etc/newrelic && clean; fi

RUN /docker-entrypoint.sh

FROM latest AS nginx

RUN apk add nginx && clean

COPY rootfs-nginx /

# Fix https://gitlab.alpinelinux.org/alpine/aports/-/issues/9364
RUN chmod 1777 /var/lib/nginx/tmp

FROM nginx AS intl

ARG version
ARG major
ARG suffix

RUN apk add "php${suffix}-intl" icu-data-full && clean

FROM latest
