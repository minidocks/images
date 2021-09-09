FROM minidocks/node
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG svgo_version=2.5.0

RUN npm -g install svgo@$svgo_version && clean

COPY rootfs /

CMD [ "svgo" ]
