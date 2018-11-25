FROM webuni/postgres:10
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV LANG cs_CZ.UTF-8

RUN wget -O /tmp/czech.tar.gz http://www.pgsql.cz/data/czech.tar.gz && cd /tmp && tar -xzf czech.tar.gz -C /tmp/ \
    && mv /tmp/fulltext_dicts/czech.* /usr/share/postgresql/tsearch_data/ && clean

COPY rootfs /
