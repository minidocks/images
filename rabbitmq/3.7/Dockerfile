FROM minidocks/erlang
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S rabbitmq && adduser -S -h /var/lib/rabbitmq -G rabbitmq rabbitmq

ENV RABBITMQ_VERSION=3.7.9 \
    PATH=/usr/share/rabbitmq/sbin:$PATH \
    RABBITMQ_HOME=/usr/share/rabbitmq \
    RABBITMQ_LOGS=- \
    RABBITMQ_SASL_LOGS=- \
    HOME=/var/lib/rabbitmq

RUN apk --update add bash procps \
        erlang-asn1 \
        erlang-hipe \
        erlang-crypto \
        erlang-eldap \
        erlang-inets \
        erlang-mnesia \
        erlang \
        erlang-os-mon \
        erlang-public-key \
        erlang-sasl \
        erlang-ssl \
        erlang-syntax-tools \
        erlang-xmerl \
    && wget -O /tmp/rabbitmq.tar.xz https://github.com/rabbitmq/rabbitmq-server/releases/download/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz \
    && tar -Jxvzf /tmp/rabbitmq.tar.xz -C /usr/share && mv /usr/share/rabbitmq* /usr/share/rabbitmq \
    && clean

RUN mkdir -p /var/lib/rabbitmq /etc/rabbitmq /var/log/rabbitmq /tmp/rabbitmq-ssl /plugins $RABBITMQ_HOME/var/log $RABBITMQ_HOME/var/lib \
    && chown -R rabbitmq:rabbitmq /var/lib/rabbitmq /etc/rabbitmq /var/log/rabbitmq /tmp/rabbitmq-ssl /plugins \
    && chmod -R 777 /var/lib/rabbitmq /etc/rabbitmq /var/log/rabbitmq /tmp/rabbitmq-ssl /plugins \
    && rm -rf $RABBITMQ_HOME/etc/rabbitmq $RABBITMQ_HOME/var/log/rabbitmq $RABBITMQ_HOME/var/lib/rabbitmq $RABBITMQ_HOME/plugins \
    && ln -s /etc/rabbitmq $RABBITMQ_HOME/etc/rabbitmq \
    && ln -s /var/log/rabbitmq $RABBITMQ_HOME/var/log/rabbitmq \
    && ln -s /var/lib/rabbitmq $RABBITMQ_HOME/var/lib/rabbitmq \
    && ln -sf /var/lib/rabbitmq/.erlang.cookie /root/

VOLUME /var/lib/rabbitmq

COPY rootfs /

EXPOSE 4369 5671 5672 25672

CMD ["rabbitmq-server"]
