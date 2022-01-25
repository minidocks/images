ARG package=nodejs-current<18
ARG base_version=edge

FROM minidocks/base:3.12 AS v3.12

FROM minidocks/base:3.13 AS v3.13

FROM minidocks/base:3.14 AS v3.14

FROM minidocks/base:3.15 AS v3.15

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
    && if [ -d /usr/local/lib/node_modules ]; then local="local/"; apk del npm && rm -rf /usr/lib/node_modules; fi \
    && rm -rf "/usr/${local}lib/node_modules/npm/docs" "/usr/${local}lib/node_modules/npm/html" clean \
    && for pkg in npm npm-check-updates; do \
         cp -ra "/usr/${local}lib/node_modules/$pkg/node_modules" / && rm -rf "/usr/${local}lib/node_modules/$pkg/node_modules"; \
       done
