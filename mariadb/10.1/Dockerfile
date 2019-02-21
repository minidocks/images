FROM minidocks/base:3.7
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S mysql && adduser -S -G mysql mysql

RUN apk --update add tzdata pwgen 'mariadb<10.2' 'mariadb-client<10.2'\
    && rm -rf /var/cache/apk/* /tmp/*

# comment out a few problematic configuration values
# don't reverse lookup hostnames, they are usually another container
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf \
    && echo -e "skip-host-cache\nskip-name-resolve" | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/mysql/my.cnf > /tmp/my.cnf \
    && mv /tmp/my.cnf /etc/mysql/my.cnf

RUN mkdir -p /run/mysqld && chown -R mysql /run/mysqld

RUN mkdir /docker-entrypoint-initdb.d

COPY rootfs /

EXPOSE 3306

CMD [ "mysqld" ]

# https://github.com/docker-library/mariadb/blob/master/10.1/Dockerfile
