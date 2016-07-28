FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

# 82 is the standard uid/gid for "www-data" in Alpine
RUN addgroup -g 82 -S www-data && adduser -u 82 -D -S -G www-data www-data

RUN apk --update add "php5>=5.6" \
       php5-json php5-phar php5-openssl php5-posix php5-iconv \
       php5-pcntl readline \
    && rm -rf /var/cache/apk/* /tmp/*

#Psysh
RUN wget http://psysh.org/psysh && chmod +x psysh && mv psysh /usr/bin/psysh

COPY .psysh /

# Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

RUN mkdir -p /app && chown www-data:www-data /app

VOLUME /app

WORKDIR /app

COPY docker-entrypoint.sh /

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "psysh", "-c", "/.psysh" ]
