FROM minidocks/puppeteer
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm i -g --unsafe-perm relaxedjs \
    && cd /usr/lib/node_modules/relaxedjs/node_modules && rm -rf puppeteer && npm link puppeteer \
    && clean

COPY rootfs /

CMD [ "relaxed" ]
