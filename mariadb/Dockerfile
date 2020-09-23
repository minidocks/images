# https://github.com/docker-library/mariadb/blob/master/10.4/Dockerfile

ARG version=10.4

FROM minidocks/base:3.7 AS v10.1

FROM minidocks/base:3.8 AS v10.2

FROM minidocks/base:3.10 AS v10.3

FROM minidocks/base:3.12 AS v10.4

FROM minidocks/base:edge AS v10.5

FROM v$version AS mariadb
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S mysql && adduser -S -G mysql mysql

RUN apk --update add tzdata pwgen mariadb mariadb-client && clean

RUN \
# comment out any "user" entires in the MySQL config ("docker-entrypoint.sh" or "--user" will handle user switching)
    sed -ri 's/^user\s/#&/' /etc/mysql/my.cnf /etc/mysql/conf.d/*; \
# purge and re-create /var/lib/mysql with appropriate ownership
    rm -rf /var/lib/mysql; \
    mkdir -p /var/lib/mysql /var/run/mysqld; \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld; \
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
    chmod 777 /var/run/mysqld; \
# comment out a few problematic configuration values
    find /etc/mysql/ -name '*.cnf' -print0 \
        | xargs -0 grep -lZE '^(bind-address|log)' \
        | xargs -rt -0 sed -Ei 's/^(bind-address|log)/#&/'; \
# don't reverse lookup hostnames, they are usually another container
    echo '[mysqld]\nskip-host-cache\nskip-name-resolve' > /etc/mysql/conf.d/docker.cnf

RUN rm -rf /var/lib/mysql; mkdir -p /var/lib/mysql /run/mysqld; chown -R mysql:mysql /var/lib/mysql /run/mysqld; chmod 777 /run/mysqld;

RUN mkdir /docker-entrypoint-initdb.d

VOLUME /var/lib/mysql

COPY rootfs /

EXPOSE 3306

CMD [ "mysqld" ]

FROM mariadb AS sphinx

RUN apk --update add sphinx && clean

CMD [ "supervise", "mysqld", "searchd" ]

FROM mariadb AS latest
