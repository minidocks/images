FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk --update add ca-certificates readline "php7<7.1" \
       php7-json php7-phar php7-openssl php7-posix php7-iconv \
       php7-pcntl php7-readline \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && rm -rf /var/cache/apk/* /tmp/*

#Psysh
RUN wget http://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

COPY .psysh /

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '070854512ef404f16bac87071a6db9fd9721da1684cd4589b1196c3faf71b9a2682e2311b36a5079825e155ac7ce150d') { echo 'Installer verified'.PHP_EOL; exit(0); } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

RUN mkdir -p /app && chown www-data:www-data /app

VOLUME /app

WORKDIR /app

COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "psysh", "-c", "/.psysh" ]
