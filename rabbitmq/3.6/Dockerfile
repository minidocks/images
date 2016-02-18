# Dockerfile is based on https://github.com/docker-library/rabbitmq/blob/master/Dockerfile
FROM webuni/erlang
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN addgroup -S rabbitmq && adduser -S -G rabbitmq rabbitmq

ENV RABBITMQ_VERSION 3.6.0

RUN apk --update add bash ca-certificates erlang-sasl erlang-public-key erlang-mnesia erlang-asn1 erlang-crypto erlang-ssl erlang-os-mon erlang-eldap erlang-eldap erlang-inets erlang-xmerl erlang-syntax-tools \
    && wget -O /tmp/rabbitmq.tar.xz https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz \
    && tar -Jxvzf /tmp/rabbitmq.tar.xz -C /usr/share && mv /usr/share/rabbitmq* /usr/share/rabbitmq \
    && apk del ca-certificates \
    && rm -rf /var/cache/apk/* /tmp/*

ENV PATH /usr/share/rabbitmq/sbin:$PATH
ENV RABBITMQ_HOME /usr/share/rabbitmq
ENV RABBITMQ_LOGS=- RABBITMQ_SASL_LOGS=-
ENV HOME /var/lib/rabbitmq

RUN mkdir -p /usr/share/rabbitmq/var/lib/rabbitmq \
    && ln -s /usr/share/rabbitmq/etc/rabbitmq /etc/rabbitmq \
    && ln -s /usr/share/rabbitmq/var/lib/rabbitmq /var/lib/rabbitmq \
    && chown -R rabbitmq:rabbitmq /var/lib/rabbitmq /etc/rabbitmq \
    && echo '[{rabbit, [{loopback_users, []}]}].' > /etc/rabbitmq/rabbitmq.config \
    && chmod 777 /var/lib/rabbitmq /etc/rabbitmq

VOLUME /var/lib/rabbitmq

# add a symlink to the .erlang.cookie in /root so we can "docker exec rabbitmqctl ..." without gosu
RUN ln -sf /var/lib/rabbitmq/.erlang.cookie /root/

RUN ln -sf /usr/share/rabbitmq/plugins /plugins

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 4369 5671 5672 25672

CMD ["rabbitmq-server"]
