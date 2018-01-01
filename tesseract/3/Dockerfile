FROM webuni/base:3.7
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add tesseract-ocr \
    && rm -rf /usr/share/tessdata/eng* \
    && rm -rf /var/cache/apk/* /tmp/*

ENV TESSDATA_PREFIX=/usr/share \
    TESSDATA_URL=https://github.com/tesseract-ocr/tessdata/raw/3.04.00

COPY rootfs /

CMD [ "tesseract" ]
