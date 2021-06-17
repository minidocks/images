FROM minidocks/php:8.0-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=4.8.1

RUN apk --update add \
        php8-mysqli \
        php8-pgsql \
        php8-pdo_mysql \
        php8-pdo_pgsql \
        php8-pdo_sqlite \
        php8-sqlite3 \
        php8-session \
    && mkdir -p /var/www \
    && wget -O /var/www/adminer.php https://www.adminer.org/static/download/${version}/adminer-${version}.php \
    && wget -O /tmp/adminer.zip https://github.com/vrana/adminer/archive/v${version}.zip \
    && unzip -q /tmp/adminer.zip -d /tmp && cp -R /tmp/adminer*/plugins/ /var/www/ && cp -R /tmp/adminer*/designs/ /var/www/ \

    && wget -O /tmp/plugins.zip https://github.com/pematon/adminer-plugins/archive/v1.7.zip && unzip -q /tmp/plugins.zip -d /tmp && cp /tmp/adminer-plugins*/*.php /var/www/plugins/ && rm /var/www/plugins/AdminerLoginServers.php \

    && wget -O /tmp/theme.zip https://github.com/pematon/adminer-theme/archive/v1.7.1.zip && unzip -q /tmp/theme.zip -d /tmp && cp -r /tmp/adminer-theme*/lib/* /var/www/ \
    && (for color in $( echo "blue orange green" | tr " " "\n" ); do mkdir "/var/www/designs/pematon-$color" && mv /var/www/css/*$color* /var/www/designs/pematon-$color/adminer.css; done) \

    && mkdir -p /var/www/designs/material-theme && wget -O /var/www/designs/material-theme/adminer.css https://github.com/arcs-/Adminer-Material-Theme/releases/download/v1.1.3/adminer.css \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

ENV PHP_UPLOAD_MAX_FILESIZE=512M \
    PHP_POST_MAX_SIZE=512M \
    PHP_MAX_EXECUTION_TIME=0 \
    PHP_MEMORY_LIMIT=512M \
    ADMINER_DESIGN=pematon-blue \
    ADMINER_PLUGINS="AdminerResponsive AdminerLoginEnvs AdminerVersionNoverify AdminerJsonPreview"

EXPOSE 8080

CMD [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/" ]
