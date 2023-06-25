FROM minidocks/base:build

RUN apk add libpng-dev && clean

WORKDIR /tmp

RUN wget -O zint.tar.gz https://github.com/zint/zint/archive/refs/tags/2.12.0.tar.gz \
    && tar xf zint.tar.gz

RUN cd zint* && mkdir build && cd build && cmake .. && make && make DESTDIR=/tmp/build install

FROM minidocks/base

RUN apk add libpng && clean

COPY --from=0 /tmp/build /
COPY rootfs /

CMD [ "zint" ]
