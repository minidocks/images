FROM webuni/php:5.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV ADMINER_VERSION 4.2.5

RUN mkdir -p /var/www/plugins \
    && wget -O /var/www/adminer.php https://www.adminer.org/static/download/${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php \
    && wget -O /var/www/plugins/plugin.php https://raw.github.com/vrana/adminer/master/plugins/plugin.php \
    && wget -O /var/www/plugins/json-column.php https://raw.github.com/vrana/adminer/master/plugins/json-column.php \
    && wget -O /var/www/plugins/edit-textarea.php https://raw.github.com/vrana/adminer/master/plugins/edit-textarea.php \
    && wget -O /var/www/plugins/restore-menu-scroll.php https://gist.githubusercontent.com/NoxArt/8085521/raw/534dff184883698da8c56c1523f5d7eab45d8854/restore-menu-scroll.php \
    && wget -O /var/www/adminer.css https://raw.githubusercontent.com/vrana/adminer/master/designs/pepa-linha/adminer.css

COPY index.php /var/www/index.php
COPY env-connections.php /var/www/plugins/env-connections.php

ENV PHP_UPLOAD_MAX_FILESIZE 128M
ENV PHP_POST_MAX_SIZE 128M
ENV PHP_MEMORY_LIMIT 512M

EXPOSE 8080

CMD [ "php", "-S", "0.0.0.0:8080", "-t", "/var/www/" ]
