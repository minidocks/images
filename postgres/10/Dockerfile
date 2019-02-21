FROM minidocks/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

# group postgres already exists
#RUN addgroup -S postgres && adduser -S -G postgres postgres
RUN postgresHome="$(echo "$(getent passwd postgres)" | cut -d: -f6)"; mkdir -p "$postgresHome"; chown -R postgres:postgres "$postgresHome"

ENV LANG=en_US.utf8 \
    PGDATA=/var/lib/postgresql/data

RUN apk --update add postgresql postgresql-contrib && clean

# make the sample config easier to munge (and "correct by default")
RUN sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" /usr/share/postgresql/postgresql.conf.sample

RUN mkdir -p /run/postgresql && chown -R postgres:postgres /run/postgresql && chmod 2777 /run/postgresql

RUN mkdir /docker-entrypoint-initdb.d

RUN mkdir -p "$PGDATA" && chown -R postgres:postgres "$PGDATA" && chmod 777 "$PGDATA" # this 777 will be replaced by 700 at runtime (allows semi-arbitrary "--user" values)

COPY rootfs /

EXPOSE 5432

CMD [ "postgres" ]

# Dockerfile is based on https://github.com/docker-library/postgres/blob/master/10/alpine/Dockerfile
