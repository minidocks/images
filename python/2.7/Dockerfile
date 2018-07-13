FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV PIP_NO_COMPILE=1 \
    PIP_CACHE_DIR=/pip-cache

COPY rootfs /

RUN apk --update add python2 py2-pip \
    && rm -rf /var/cache/apk/* && pyclean

RUN mkdir "$PIP_CACHE_DIR" && chmod a+rwx "$PIP_CACHE_DIR" \
    && pip install -U pip pipenv wheel \
    && rm -rf $PIP_CACHE_DIR/* && pyclean

CMD [ "python" ]
