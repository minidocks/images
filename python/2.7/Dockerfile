FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV PIP_NO_COMPILE=1 \
    PIP_CACHE_DIR=/pip-cache \
    CLEAN="$CLEAN:\$PIP_CACHE_DIR/:pyclean"

COPY rootfs /

RUN apk --update add python2 py2-pip \
    && rm -rf /var/cache/apk/* && pyclean

RUN mkdir "$PIP_CACHE_DIR" && chmod a+rwx "$PIP_CACHE_DIR" \
    && pip install -U pip pipenv wheel \
    && clean

CMD [ "python" ]
