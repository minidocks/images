FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV NPM_CONFIG_CACHE=/npm-cache \
    YARN_CACHE_FOLDER=/yarn-cache \
    CLEAN="$CLEAN:\$NPM_CONFIG_CACHE/:\$YARN_CACHE_FOLDER/:/usr/lib/node_modules/npm/doc:/usr/lib/node_modules/npm/man:/usr/lib/node_modules/npm/html"

RUN printf "@main http://dl-cdn.alpinelinux.org/alpine/edge/main\n@community http://dl-cdn.alpinelinux.org/alpine/edge/community\n" >> /etc/apk/repositories \
    && apk --update add npm "libcrypto1.1@main" "libssl1.1@main" "libuv@main" "nodejs-current@community<12" \
    && mkdir -p "$NPM_CONFIG_CACHE" "$YARN_CACHE_FOLDER" && chmod 777 "$NPM_CONFIG_CACHE" "$YARN_CACHE_FOLDER" \
    && npm i -g npm@latest && npm install -g yarn \
    && clean

COPY rootfs /

CMD [ "node" ]
