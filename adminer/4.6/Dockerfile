FROM minidocks/php:7.1-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV ADMINER_VERSION 4.6.2

RUN apk --update add \
        php7-mysqli \
        php7-pgsql \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-sqlite3 \
        php7-session \
    && mkdir -p /var/www \
    && wget -O /var/www/adminer.php https://www.adminer.org/static/download/${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php \
    && wget -O /tmp/adminer.zip https://github.com/vrana/adminer/archive/v${ADMINER_VERSION}.zip \
    && unzip /tmp/adminer.zip -d /tmp && cp -R /tmp/adminer*/plugins/ /var/www/ && cp -R /tmp/adminer*/designs/ /var/www/ \

    && wget -O /tmp/plugins.zip https://github.com/pematon/adminer-plugins/archive/v1.3.zip && unzip /tmp/plugins.zip -d /tmp && cp /tmp/adminer-plugins*/*.php /var/www/plugins/ \
    # Fix PHP Fatal error:  Cannot declare class AdminerLoginServers, because the name is already in use in /var/www/plugins/login-servers.php \
    && rm -rf /var/www/plugins/AdminerLoginServers.php \

    && wget -O /tmp/theme.zip https://github.com/pematon/adminer-theme/archive/v1.5.zip && unzip /tmp/theme.zip -d /tmp && cp -r /tmp/adminer-theme*/lib/* /var/www/ \
    && (for color in $( echo "blue orange green" | tr " " "\n" ); do mkdir "/var/www/designs/pematon-$color" && mv /var/www/css/*$color* /var/www/designs/pematon-$color/adminer.css; done) \

    && mkdir -p /var/www/designs/material-theme && wget -O /var/www/designs/material-theme/adminer.css https://github.com/arcs-/Adminer-Material-Theme/releases/download/v1.1.0/adminer.css \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

ENV PHP_UPLOAD_MAX_FILESIZE=128M \
    PHP_POST_MAX_SIZE=128M \
    PHP_MEMORY_LIMIT=512M \
    ADMINER_DESIGN=pematon-blue \
    ADMINER_PLUGINS="AdminerResponsive AdminerLoginEnvs AdminerVersionNoverify AdminerJsonPreview"

EXPOSE 8080

CMD [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/" ]
