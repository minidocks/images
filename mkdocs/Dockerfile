ARG base_image=python

FROM minidocks/python AS python

FROM minidocks/weasyprint AS weasyprint

FROM $base_image AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG mkdocs_version=1.0.4
ARG mkdocs_material_version=4.6.3

RUN pip install \
      markdown-include \
      mkdocs==$mkdocs_version \
      mkdocs-alabaster \
      mkdocs-awesome-pages-plugin \
      mkdocs-cinder \
      mkdocs-exclude \
      mkdocs-git-committers-plugin \
      mkdocs-git-revision-date-plugin \
      mkdocs-ivory \
      mkdocs-macros-plugin \
      mkdocs-markdownextradata-plugin \
      mkdocs-material==$mkdocs_material_version \
      mkdocs-merge \
      mkdocs-monorepo-plugin \
      mkdocs-redirects \
      mkdocs-rtd-dropdown \
      mkdocs-versioning \
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
