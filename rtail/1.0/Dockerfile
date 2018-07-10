FROM webuni/node:9
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN npm install -g r-tail && rm -rf $NPM_CONFIG_CACHE/* /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/html

CMD [ "rtail-server" ]
