# Dockerfile is based on https://github.com/docker-library/postgres/blob/master/9.5
FROM webuni/base:3.3

#RUN addgroup -S postgres && adduser -S -G postgres postgres

RUN echo http://dl-4.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk --update add postgresql postgresql-contrib \
    && sed -i '$ d' /etc/apk/repositories \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir -p /var/run/postgresql && chown -R postgres /var/run/postgresql

RUN mkdir /docker-entrypoint-initdb.d

ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 5432

CMD ["postgres"]
