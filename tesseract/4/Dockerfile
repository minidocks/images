FROM minidocks/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN printf "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing\n" >> /etc/apk/repositories \
    && apk --update add --virtual .build-dependencies g++ git make automake autoconf libtool leptonica-dev pango-dev icu-dev cairo-dev && apk add autoconf-archive@testing \
    && wget -O /tmp/tesseract.tar.gz https://github.com/tesseract-ocr/tesseract/archive/master.tar.gz \
    && tar -xzf /tmp/tesseract.tar.gz -C /tmp && cd /tmp/tesseract*/ \
    && ./autogen.sh \
    && ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man --infodir=/usr/share/info --localstatedir=/var --disable-static \
    && make && make training && make install && make training-install \
    && apk del .build-dependencies autoconf-archive && cd / && rm -rf /tmp/tesseract* \
    && rm -rf /var/cache/apk/* /tmp/*

RUN apk --update --no-cache add libstdc++ libgomp leptonica && rm -rf /var/cache/apk/* /tmp/*

ENV TESSDATA_PREFIX=/usr/share \
    TESSDATA_URL=https://github.com/tesseract-ocr/tessdata/raw/master

COPY rootfs /

RUN TESSDATA_URL=https://github.com/tesseract-ocr/tessdata/raw/3.04.00 && tessdata osd equ

CMD [ "tesseract" ]
