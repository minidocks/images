FROM minidocks/php:8.1-nginx
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

WORKDIR /var/www

RUN rm -rf *
RUN su-exec www-data:www-data composer create-project flarum/flarum . && chmod a+x flarum && clean
RUN su-exec www-data:www-data mkdir -p assets
RUN wget -O public/favicon.ico https://flarum.org/favicon.ico

ENV PATH="/var/www:$PATH"

ONBUILD ARG FLARUM_EXTENSIONS

ONBUILD RUN for extension in $FLARUM_EXTENSIONS; do \
              su-exec www-data:www-data composer require "$extension"; \
            done && clean

COPY rootfs /

RUN chown -R www-data:www-data /var/www

CMD ["supervise", "php-fpm", "nginx"]
