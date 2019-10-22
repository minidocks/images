ARG version=10.4

FROM minidocks/base:3.7 AS v10.1

FROM minidocks/base:3.8 AS v10.2

FROM minidocks/base:3.10 AS v10.3

FROM minidocks/base:edge AS v10.4

FROM v$version
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S mysql && adduser -S -G mysql mysql

RUN apk --update add tzdata pwgen mariadb mariadb-client && clean

# comment out a few problematic configuration values
# don't reverse lookup hostnames, they are usually another container
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf \
    && echo -e "skip-host-cache\nskip-name-resolve" | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/mysql/my.cnf > /tmp/my.cnf \
    && mv /tmp/my.cnf /etc/mysql/my.cnf

RUN rm -rf /var/lib/mysql; mkdir -p /var/lib/mysql /run/mysqld; chown -R mysql:mysql /var/lib/mysql /run/mysqld; chmod 777 /run/mysqld;

RUN mkdir /docker-entrypoint-initdb.d

VOLUME /var/lib/mysql

COPY rootfs /

EXPOSE 3306

CMD [ "mysqld" ]

# https://github.com/docker-library/mariadb/blob/master/10.3/Dockerfile
