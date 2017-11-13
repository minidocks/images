FROM webuni/node:8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV VERDACCIO_VERSION=2.6.6

RUN yarn global add verdaccio@$VERDACCIO_VERSION sinopia-github-oauth sinopia-gitlab \
    && rm -rf /var/cache/apk/* $NPM_CONFIG_CACHE/* $YARN_CACHE_FOLDER/* /tmp/*

COPY rootfs /

RUN addgroup -S verdaccio && adduser -S -G verdaccio verdaccio \
    && mkdir -p /verdaccio/storage /verdaccio/conf \
    && chown -R verdaccio:verdaccio /verdaccio

USER verdaccio

VOLUME ["/verdaccio"]

CMD [ "verdaccio", "--config", "/verdaccio/conf/config.yaml", "--listen", "http://0.0.0.0:4873" ]
