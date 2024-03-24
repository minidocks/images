ARG package=nodejs-current<22
ARG base_version=21

FROM minidocks/base:3.18 AS v18

FROM minidocks/base:3.19 AS v20

FROM minidocks/base:3.19 AS v21

FROM v$base_version AS base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG package

RUN apk add $package && clean;

COPY rootfs /

CMD [ "node" ]

FROM base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV NPM_CONFIG_CACHE=/npm-cache \
    NPM_CONFIG_UPDATE_NOTIFIER=false \
    YARN_CACHE_FOLDER=/yarn-cache \
    NODE_PATH=/node_modules \
    CLEAN="$CLEAN:\$NPM_CONFIG_CACHE/:\$YARN_CACHE_FOLDER/"

ARG base_version
ARG package

# Fix https://github.com/npm/uid-number/issues/3#issuecomment-453727058
# Fix https://bobbyhadz.com/blog/javascript-chalk-error-err-require-esm-of-es-module
RUN /docker-entrypoint.d/10-cache.sh && apk add npm \
    && npm i -g "npm" corepack npm-check-updates && corepack prepare yarn@stable --activate \
    && if [ -d /usr/local/lib/node_modules ]; then local="local/"; apk del npm && rm -rf /usr/lib/node_modules; fi \
    && rm -rf "/usr/${local}lib/node_modules/npm/docs" "/usr/${local}lib/node_modules/npm/html" && clean
