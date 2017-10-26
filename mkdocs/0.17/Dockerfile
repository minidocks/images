FROM webuni/python:3.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV MKDOCS_VERSION=0.17.0 \
    MKDOCS_MATERIAL_VERSION=1.12.1

#TODO mkdocs-merge
RUN pip install \
      mkdocs==$MKDOCS_VERSION \
      mkdocs-material==$MKDOCS_MATERIAL_VERSION \
      mkdocs-alabaster \
      pygments \
      pymdown-extensions \
    && rm -rf /root/.cache/pip && find /usr/lib/python3.6 -name '*.pyc' -delete

COPY rootfs /

CMD [ "mkdocs" ]
