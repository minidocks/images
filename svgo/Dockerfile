FROM minidocks/node
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN npm -g install svgo clean

COPY rootfs /

CMD [ "svgo" ]
