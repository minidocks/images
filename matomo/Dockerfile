FROM minidocks/php:8.1-nginx AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

WORKDIR /var/www

RUN rm -rf *
RUN wget https://builds.matomo.org/matomo-latest.tar.gz && tar --strip-components 1 -xzf matomo-latest.tar.gz && rm matomo-latest.tar.gz && chown www-data:www-data -R /var/www
RUN wget -O EnvironmentVariables.tar.gz https://github.com/matomo-org/plugin-EnvironmentVariables/archive/refs/tags/4.0.1.tar.gz \
    && tar -xzf EnvironmentVariables.tar.gz && mv plugin-EnvironmentVariables* plugins/EnvironmentVariables && rm EnvironmentVariables.tar.gz \
    && chown www-data:www-data -R /var/www
#RUN sed -i '/Plugins\[\] = CustomDimensions/ a Plugins[] = EnvironmentVariables' /var/www/config/global.ini.php

ENV PATH="/var/www:$PATH"

COPY rootfs /

RUN chown -R www-data:www-data /var/www

CMD ["supervise", "php-fpm", "nginx", "crond"]
