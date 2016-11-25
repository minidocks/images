FROM webuni/ffmpeg:3
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV UNPAPER_VERSION=6.1

RUN wget -O /tmp/unpaper.tar.gz https://github.com/Flameeyes/unpaper/archive/unpaper-${UNPAPER_VERSION}.tar.gz \
    && tar -xvzf /tmp/unpaper.tar.gz -C /tmp && rm /tmp/unpaper.tar.gz && mv /tmp/unpaper* /tmp/unpaper \
    && apk --update add --virtual build-dependencies autoconf automake make g++ ffmpeg-dev libtool libxslt \
    && cd /tmp/unpaper && aclocal && automake --add-missing && autoconf \
    && ./configure && make && make install \
    && apk del build-dependencies && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "unpaper" ]

