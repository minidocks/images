ARG version=12

FROM minidocks/base:3.8 AS v10

FROM minidocks/base:3.10 AS v11

FROM minidocks/base:3.12 AS v12

FROM v$version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN if [ ! "$(getent passwd postgres)" ]; then \
        addgroup -S postgres && adduser -S -h /var/lib/postgresql -G postgres postgres; \
    fi && mkdir -p /var/lib/postgresql; chown -R postgres:postgres /var/lib/postgresql

ENV LANG=en_US.utf8 \
    PGDATA=/var/lib/postgresql/data

RUN apk --update add postgresql postgresql-contrib && clean

# make the sample config easier to munge (and "correct by default")
RUN sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" /usr/share/postgresql/postgresql.conf.sample

RUN mkdir -p /run/postgresql && chown -R postgres:postgres /run/postgresql && chmod 2777 /run/postgresql

RUN mkdir /docker-entrypoint-initdb.d

RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA" # this 777 will be replaced by 700 at runtime (allows semi-arbitrary "--user" values)

VOLUME /var/lib/postgresql/data

COPY rootfs /

EXPOSE 5432
CMD [ "postgres" ]

FROM latest AS czech

ENV LANG cs_CZ.UTF-8

RUN wget -O /tmp/czech.tar.gz https://postgres.cz/data/czech.tar.gz && cd /tmp && tar -xzf czech.tar.gz -C /tmp/ \
    && mv /tmp/fulltext_dicts/czech* /usr/share/postgresql/tsearch_data/ && clean

RUN wget -O /tmp/czech.tar.gz https://github.com/freaz/docker-postgres-czech-unaccent/raw/master/czech_unaccent.tar.gz && cd /tmp && tar -xzf czech.tar.gz -C /tmp/ \
    && mv /tmp/fulltext_dicts/czech* /usr/share/postgresql/tsearch_data/ && clean

COPY rootfs-czech /

FROM latest
