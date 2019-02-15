FROM webuni/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV MKDOCS_VERSION=0.17.5 \
    MKDOCS_MATERIAL_VERSION=2.9.4

RUN pip install \
      mkdocs==$MKDOCS_VERSION \
      mkdocs-material==$MKDOCS_MATERIAL_VERSION \
      mkdocs-alabaster \
      mkdocs-rtd-dropdown \
      "mkdocs-awesome-pages-plugin<2.0" \
      pygments \
      pymdown-extensions \
    && clean

COPY rootfs /

CMD [ "mkdocs" ]
