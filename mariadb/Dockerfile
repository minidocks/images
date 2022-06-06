# https://github.com/docker-library/mariadb/blob/master/10.6/Dockerfile

ARG version=10.6

FROM minidocks/base:3.12 AS v10.4

FROM minidocks/base:3.14 AS v10.5

FROM minidocks/base:3.16 AS v10.6

FROM v$version AS mariadb
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S mysql && adduser -S -G mysql mysql

RUN apk add tzdata pwgen mariadb mariadb-client mariadb-backup mariadb-server-utils zstd && clean

RUN \
    # Temporary work around for MDEV-27980, closes #417
    sed -i -e 's/--loose-disable-plugin-file-key-management//' /usr/bin/mysql_install_db ; \
    rm -rf /var/lib/apt/lists/*; \
    # purge and re-create /var/lib/mysql with appropriate ownership
    rm -rf /var/lib/mysql; \
    mkdir -p /var/lib/mysql /run/mysqld; \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld; \
    # ensure that /run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
    chmod 777 /run/mysqld; \
    # comment out a few problematic configuration values
    find /etc/my.cnf /etc/my.cnf.d/ -name '*.cnf' -print0 \
      | xargs -rt -0 sed -Ei 's/^(skip-networking|bind-address|log|user\s)/#&/'; \
    # don't reverse lookup hostnames, they are usually another container
    # Issue #327 Correct order of reading directories /etc/mysql/mariadb.conf.d before /etc/mysql/conf.d (mount-point per documentation)
    sed -i -e '/includedir/i[mariadb]\nskip-host-cache\nskip-name-resolve\n' /etc/my.cnf;

ENV MARIADB_BIND__ADDRESS=0.0.0.0 \
    MARIADB_SKIP__NETWORKING=0 \
    MARIADB_LOG_ERROR=/dev/stderr.pipe \
    MARIADB_GENERAL_LOG_FILE=/dev/stdout.pipe

RUN mkdir /docker-entrypoint-initdb.d

VOLUME /var/lib/mysql

COPY rootfs /

EXPOSE 3306

CMD [ "mariadbd" ]

FROM mariadb AS sphinx

RUN apk --update add sphinx && clean

CMD [ "supervise", "mariadbd", "searchd" ]

FROM mariadb AS latest
