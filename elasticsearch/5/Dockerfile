FROM minidocks/java:8-jre
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch

ENV ELASTICSEARCH_VERSION 5.5.1

RUN apk add --update bash \
    && wget -qO /tmp/elasticsearch.tar.gz https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ELASTICSEARCH_VERSION}.tar.gz \
    && tar -xzf /tmp/elasticsearch.tar.gz -C /usr/share && mv /usr/share/elasticsearch* /usr/share/elasticsearch \
    && rm -rf /var/cache/apk/* /tmp/*

#    && sed -i "s|^#\?\\s*\(discovery\.zen\.minimum_master_nodes:\).*|\1 1|" /usr/share/elasticsearch/config/elasticsearch.yml

RUN cd /usr/share/elasticsearch \
    && for path in \
        /data \
        ./logs \
        ./config \
        ./config/scripts \
        ./plugins \
    ; do \
        mkdir -p "$path"; \
        chown -R elasticsearch:elasticsearch "$path"; \
    done \
    && ln -s /data ./data && chown -R elasticsearch:elasticsearch ./data \
    && mv ./config /etc/elasticsearch && ln -s /etc/elasticsearch ./config

VOLUME /data

ENV PATH=/usr/share/elasticsearch/bin:$PATH \
    ES_JAVA_OPTS='-Xms2g -Xmx2g' \
    ES_CONF_NETWORK__HOST=0.0.0.0 \
    ES_CONF_TRANSPORT__HOST=0.0.0.0 \
    ES_CONF_DISCOVERY__ZEN__MINIMUM_MASTER_NODES=1 \
    ES_CONF_CLUSTER__ROUTING__ALLOCATION__DISK__THRESHOLD_ENABLED=0

COPY rootfs /

RUN sh /docker-entrypoint.d/20-elasticsearch.sh

EXPOSE 9200 9300

CMD ["elasticsearch"]

# Dockerfile is based on https://github.com/docker-library/elasticsearch/blob/master/5/alpine/Dockerfile
