FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

# group postgres already exists
#RUN addgroup -S postgres && adduser -S -G postgres postgres

RUN apk --update add 'postgresql<9.6' postgresql-contrib \
    && rm -rf /var/cache/apk/* /tmp/*

# make the sample config easier to munge (and "correct by default")
RUN sed -ri "s!^#?(listen_addresses)\s*=\s*\S+.*!\1 = '*'!" /usr/share/postgresql/postgresql.conf.sample

RUN mkdir -p /run/postgresql && chown -R postgres /run/postgresql

RUN mkdir /docker-entrypoint-initdb.d

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

COPY rootfs /

EXPOSE 5432

CMD [ "postgres" ]

# Dockerfile is based on https://github.com/docker-library/postgres/blob/master/9.5/alpine/Dockerfile
