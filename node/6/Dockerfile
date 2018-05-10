FROM webuni/base:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV NPM_CONFIG_CACHE=/npm \
    YARN_CACHE_FOLDER=/yarn

RUN apk --update add 'nodejs-npm<7' \
    && mkdir -p $NPM_CONFIG_CACHE $YARN_CACHE_FOLDER && chmod a+rwx -R $NPM_CONFIG_CACHE $YARN_CACHE_FOLDER \
    && npm i -g npm@latest && npm install -g yarn \
    && rm -rf /var/cache/apk/* $NPM_CONFIG_CACHE/* $YARN_CACHE_FOLDER/* /tmp/* /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/html

COPY rootfs /

CMD [ "node" ]
