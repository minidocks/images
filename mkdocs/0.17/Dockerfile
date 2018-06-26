FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV MKDOCS_VERSION=0.17.4 \
    MKDOCS_MATERIAL_VERSION=2.9.1

RUN pip install \
      mkdocs==$MKDOCS_VERSION \
      mkdocs-material==$MKDOCS_MATERIAL_VERSION \
      mkdocs-alabaster \
      mkdocs-awesome-pages-plugin \
      pygments \
      pymdown-extensions \
    && rm -rf $PIP_CACHE_DIR/* && pyclean

COPY rootfs /

CMD [ "mkdocs" ]
