ARG version=4.0.0
ARG base_version=v4
ARG lang="eng"

FROM minidocks/base:3.8 as v3

FROM minidocks/librsvg as v4

FROM $base_version as latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ENV TESSDATA_PREFIX=/usr/share/tessdata \
    TESSDATA_URL=https://github.com/tesseract-ocr/tessdata/raw/$version

# https://github.com/tesseract-ocr/tesseract/issues/898#issuecomment-315202167
ENV OMP_THREAD_LIMIT=1

RUN apk --update add tesseract-ocr && chmod a+rwx "$TESSDATA_PREFIX" && clean

COPY rootfs /

RUN if [ "$version" != '3.04.00' ]; then tessdata osd equ; fi

CMD [ "tesseract" ]

# Lang
FROM latest as lang
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG lang

RUN tessdata $lang

FROM latest
