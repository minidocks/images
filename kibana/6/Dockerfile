FROM minidocks/node:8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S kibana && adduser -S -G kibana kibana

ENV KIBANA_VERSION=6.3.1 \
    ELASTIC_CONTAINER=true \
    PATH=/usr/share/kibana/bin:$PATH

RUN wget -qO /tmp/kibana.tar.gz "https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz" \
    && tar -xzf /tmp/kibana.tar.gz -C /usr/share && mv /usr/share/kibana* /usr/share/kibana \
    && rm -rf /usr/share/kibana/node \
    && mkdir -p /etc/kibana && mv /usr/share/kibana/config/kibana.yml /etc/kibana/kibana.yml && ln -s /etc/kibana/kibana.yml /usr/share/kibana/config/kibana.yml \
    && chown kibana:kibana -R /usr/share/kibana \
    && rm -rf /tmp/*

# the default "server.host" is "localhost" in 5+
RUN sed -ri "s!^(\#\s*)?(server\.host:).*!\2 '0.0.0.0'!" /etc/kibana/kibana.yml \
    && grep -q "^server\.host: '0.0.0.0'\$" /etc/kibana/kibana.yml

# ensure the default configuration is useful when using --link
RUN sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 'http://elasticsearch:9200'!" /etc/kibana/kibana.yml \
    && grep -q "^elasticsearch\.url: 'http://elasticsearch:9200'\$" /etc/kibana/kibana.yml

COPY rootfs /

EXPOSE 5601

CMD [ "kibana" ]

# Dockerfile based on https://github.com/elastic/kibana-docker
