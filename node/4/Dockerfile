FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN echo '@3.4 http://dl-cdn.alpinelinux.org/alpine/v3.4/main' >> /etc/apk/repositories \
    && apk --update add 'nodejs-lts@3.4<5' \
    && npm update -g && npm install -g yarn \
    && sed -i '$ d' /etc/apk/repositories \
    && rm -rf /var/cache/apk/* /root/.npm /tmp/* /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/html

COPY rootfs /

CMD [ "node" ]
