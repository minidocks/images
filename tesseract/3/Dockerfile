FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add tesseract-ocr \
    && rm -rf /var/cache/apk/* /tmp/*

ENV TESSDATA_PREFIX=/usr/share

COPY rootfs /

RUN tessdata osd equ

CMD [ "tesseract" ]
