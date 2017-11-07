FROM webuni/base:3.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV NPM_CONFIG_CACHE=/npm \
    YARN_CACHE_FOLDER=/yarn

RUN echo '@main http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
    && apk --update add 'nodejs-npm@main>=8' 'nodejs@main>=8' 'libuv@main>=1.15' \
    && mkdir -p $NPM_CONFIG_CACHE $YARN_CACHE_FOLDER && chmod a+rwx -R $NPM_CONFIG_CACHE $YARN_CACHE_FOLDER \
    && npm update -g && npm install -g yarn \
    && sed -i '$ d' /etc/apk/repositories \
    && rm -rf /var/cache/apk/* $NPM_CONFIG_CACHE/* $YARN_CACHE_FOLDER/* /tmp/* /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/html

COPY rootfs /

CMD [ "node" ]
