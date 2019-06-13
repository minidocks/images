ARG base_image=python

FROM minidocks/python AS python

FROM minidocks/weasyprint AS weasyprint

FROM $base_image AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG mkdocs_version=1.0.4
ARG mkdocs_material_version=4.3.1

RUN pip install \
      mkdocs==$mkdocs_version \
      mkdocs-material==$mkdocs_material_version \
      mkdocs-alabaster \
      mkdocs-cinder \
      mkdocs-rtd-dropdown \
      mkdocs-awesome-pages-plugin \
      mkdocs-merge \
      pygments \
      pymdown-extensions \
    && clean

COPY rootfs /

CMD [ "mkdocs" ]

FROM latest AS pdf

RUN pip install mkdocs-pdf-export-plugin && clean

RUN wget -O /tmp/roboto.zip https://fonts.google.com/download?family=Roboto \
    && unzip /tmp/roboto.zip -d /usr/share/fonts/truetype \
    && fc-cache -f \
    && clean

FROM latest
