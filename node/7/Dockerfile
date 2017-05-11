FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV NPM_CONFIG_CACHE=/npm

RUN apk --update add 'nodejs-current<8' \
    && mkdir -p /npm && chmod a+rwx -R /npm \
    && npm update -g && npm install -g yarn \
    && rm -rf /var/cache/apk/* /npm/* /tmp/* /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/html

COPY rootfs /

CMD [ "node" ]
