ARG repository='edge'
ARG data_version=4.0.0
ARG lang="eng"

FROM minidocks/librsvg as latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG repository
ARG data_version
ENV TESSDATA_PREFIX=/usr/share/tessdata \
    TESSDATA_URL=https://github.com/tesseract-ocr/tessdata/raw/$data_version

# https://github.com/tesseract-ocr/tesseract/issues/898#issuecomment-315202167
ENV OMP_THREAD_LIMIT=1

RUN apk --update add "tesseract-ocr@$repository" && chmod a+rwx "$TESSDATA_PREFIX" && clean

COPY rootfs /

RUN if [ "$data_version" = '4.0.0' ]; then tessdata osd equ; fi

CMD [ "tesseract" ]

# Lang
FROM latest as lang
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG lang

RUN tessdata $lang

FROM latest
