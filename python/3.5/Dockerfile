FROM webuni/base:3.5
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV PIP_NO_COMPILE=1 \
    PIP_CACHE_DIR=/pip-cache \
    CLEAN="$CLEAN:\$PIP_CACHE_DIR/:pyclean"

COPY rootfs /

RUN apk --update add "python3<3.6" \
    && rm -rf /var/cache/apk/* && pyclean

# make some useful symlinks that are expected to exist
RUN ln -s /usr/bin/python3 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && ln -s /usr/bin/easy_install-3.5 /usr/bin/easy_install \
    && ln -s /usr/bin/idle3 /usr/bin/idle \
    && ln -s /usr/bin/pydoc3 /usr/bin/pydoc

RUN mkdir "$PIP_CACHE_DIR" && chmod a+rwx "$PIP_CACHE_DIR" \
    && pip install -U pip pipenv wheel \
    && clean

CMD [ "python" ]
