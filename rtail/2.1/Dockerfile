FROM minidocks/node:10
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV RTAIL_VERSION=2.1.3

RUN npm install -g r-tail@$RTAIL_VERSION && clean

COPY rootfs /

CMD [ "rtail-server" ]
