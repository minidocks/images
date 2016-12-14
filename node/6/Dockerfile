FROM webuni/base:3.4
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add 'nodejs<7' \
    && npm update -g && npm install -g yarn \
    && rm -rf /var/cache/apk/* /root/.npm /tmp/* /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/html

COPY rootfs /

CMD [ "node" ]
