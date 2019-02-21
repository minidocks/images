FROM minidocks/node:8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV RTAIL_VERSION=1.0.6

RUN npm install -g r-tail@$RTAIL_VERSION && rm -rf $NPM_CONFIG_CACHE/* /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/html

COPY rootfs /

CMD [ "rtail-server" ]
