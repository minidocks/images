ARG version=8.5
ARG suffix=85

FROM minidocks/base AS base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ARG suffix

# 82 is the standard uid/gid for "www-data" in Alpine
RUN getent group www-data >/dev/null || addgroup -g 82 -S www-data; getent passwd www-date >/dev/null || adduser -u 82 -S -s /bin/sh -G www-data www-data

# Add repository https://pkgs.henderkes.com/
RUN apk add --no-cache --virtual .wget-deps wget \
    && echo "https://pkg.henderkes.com/api/packages/${suffix}/alpine/main/php-zts" >> /etc/apk/repositories \
    && wget -q --content-disposition -P /etc/apk/keys/ "https://pkg.henderkes.com/api/packages/${suffix}/alpine/key" \
    && apk del .wget-deps && clean

RUN apk add php-zts-cli php-zts-apcu nss-tools frankenphp && clean \
    && if [ ! -e "/usr/bin/php$suffix" ]; then ln -s php-zts "/usr/bin/php$suffix"; fi

#Psysh
RUN wget https://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

ENV PHP_INI_DIR=/etc/php-zts \
    PHP_ERROR_LOG=/dev/stderr.pipe \
    PHP_MEMORY_LIMIT=-1 \
    COMPOSER_ALLOW_SUPERUSER=1 \
    COMPOSER_HOME=/composer \
    COMPOSER_CACHE_DIR=/composer-cache \
    COMPOSER_HTACCESS_PROTECT=0 \
    COMPOSER_MEMORY_LIMIT=-1 \
    CLEAN="$CLEAN:\$COMPOSER_CACHE_DIR/"
#    RAWEXEC="$RAWEXEC frankenphp"

RUN mkdir -p /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chown www-data:www-data /var/www "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR" && chmod a+rwx "$COMPOSER_HOME" "$COMPOSER_CACHE_DIR"

# Composer
RUN php --version && wget -O composer-setup.php https://getcomposer.org/installer \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && clean

COPY rootfs /

CMD [ "frankenphp" ]

FROM base AS latest

ARG suffix

RUN for module in \
        bcmath \
        calendar \
        cgi \
        dom \
        exif \
        excimer \
        ffi \
        fileinfo \
        ftp \
        gd \
        gettext \
        gmp \
#        imap \
        ldap \
        mysqli \
        mysqlnd \
        memcached \
        memcached \
        mongodb \
        opcache \
        opentelemetry \
        pcov \
        protobuf \
        redis \
        xdebug \
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
    ; do modules="$modules php-zts-$module"; done \
    && apk add $modules \
    && clean

ENV PHP_EXT_XDEBUG=0 \
    PHP_XDEBUG__LOG=/dev/stdout.pipe \
    PHP_XDEBUG__DISCOVER_CLIENT_HOST=true \
    PHP_XDEBUG__CLIENT_HOST=172.17.0.1 \
    PHP_XDEBUG__CLIENT_PORT=9003 \
    XDEBUG_MODE=develop,debug

RUN /docker-entrypoint.sh

FROM latest AS intl

RUN apk add php-zts-intl icu-data-full && clean

FROM latest
