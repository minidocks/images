FROM webuni/base:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV SCANTAILOR_VERSION=0_9_12_2

RUN wget -O /tmp/scantailor.tar.gz https://github.com/scantailor/scantailor/archive/RELEASE_${SCANTAILOR_VERSION}.tar.gz \
    && tar -xvzf /tmp/scantailor.tar.gz -C /tmp && rm /tmp/*.tar.gz && mv /tmp/scantailor* /tmp/scantailor \
    && apk --update add qt-x11 icu-libs && apk add --virtual build-dependencies cmake make g++ qt-dev boost-dev libjpeg-turbo-dev tiff-dev libpng-dev zlib-dev icu-dev \
    && cd /tmp/scantailor && cmake . && make && make install \
    && apk del build-dependencies && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "scantailor-cli" ]
