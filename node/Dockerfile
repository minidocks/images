ARG package=nodejs-current<16
ARG base_version=edge

FROM minidocks/base:3.9 AS v3.9

FROM minidocks/base:3.10 AS v3.10

FROM minidocks/base:3.11 AS v3.11

FROM minidocks/base:3.12 AS v3.12

FROM minidocks/base:3.13 AS v3.13

FROM minidocks/base:3.14 AS v3.14

FROM minidocks/base:edge AS vedge

FROM v$base_version AS base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG package

RUN apk --update add $package && clean;

COPY rootfs /

CMD [ "node" ]

FROM base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV NPM_CONFIG_CACHE=/npm-cache \
    YARN_CACHE_FOLDER=/yarn-cache \
    NODE_PATH=/node_modules \
    CLEAN="$CLEAN:\$NPM_CONFIG_CACHE/:\$YARN_CACHE_FOLDER/"

ARG package

# Fix https://github.com/npm/uid-number/issues/3#issuecomment-453727058
RUN /docker-entrypoint.d/10-cache.sh && apk --update add npm \
    && npm config set unsafe-perm true && npm i -g npm@latest npm-check-updates yarn && npm config set unsafe-perm false \
    && rm -rf /usr/lib/node_modules/npm/docs /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/html && clean \
    && for pkg in npm npm-check-updates; do cp -ra /usr/lib/node_modules/$pkg/node_modules / && rm -rf /usr/lib/node_modules/$pkg/node_modules; done
