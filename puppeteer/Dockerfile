FROM minidocks/node
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

RUN PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true npm i -g --unsafe-perm "puppeteer@$version" puppeteer-cli && clean

COPY rootfs /

RUN patch /usr/lib/node_modules/puppeteer/lib/Launcher.js /root/Launcher.js.patch

CMD ["puppeteer"]
