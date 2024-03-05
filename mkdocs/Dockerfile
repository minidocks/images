ARG base_image=python

FROM minidocks/python AS python

FROM minidocks/weasyprint AS weasyprint

FROM $base_image AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG mkdocs_version=1.5.3

RUN apk add py3-regex py3-pynacl py3-ruamel.yaml && pip install \
      mkdocs==$mkdocs_version \
      \
      mkdocs-abs-rel-plugin \
      mkdocs-add-number-plugin \
      mkdocs-autolinks-plugin \
      mkdocs-autorefs \
      mkdocs-awesome-pages-plugin \
      mkdocs-codeinclude-plugin \
      mkdocs-enumerate-headings-plugin \
      mkdocs-exclude \
      mkdocs-exclude-search \
      mkdocs-gallery \
      mkdocs-gen-files \
      mkdocs-git-authors-plugin \
      mkdocs-git-committers-plugin-2 \
      mkdocs-git-revision-date-localized-plugin \
      mkdocs-img2fig-plugin \
      mkdocs-include-markdown-plugin \
      mkdocs-kroki-plugin \
      mkdocs-literate-nav \
      mkdocs-localsearch \
      mkdocs-macros-plugin \
      mkdocs-markdownextradata-plugin \
      mkdocs-merge \
      mkdocs-minify-plugin \
      mkdocs-monorepo-plugin \
      mkdocs-multirepo \
      mkdocs-multirepo-plugin \
      mkdocs-no-sitemap-plugin \
      mkdocs-print-site-plugin \
      mkdocs_pymdownx_material_extras \
      mkdocs-safe-text-plugin \
      mkdocs-same-dir \
      mkdocs-section-index \
      mkdocs-simple-hooks \
      mkdocs-simple-plugin \
      mkdocs-swagger-ui-tag \
      mkdocs-redirects \
      mkdocs-versioning \
      mkdocs-with-confluence \
      mkdocstrings \
      \
      mkdocs-alabaster \
      mkdocs-cinder \
      mkdocs-kpn \
      mkdocs-material \
      \
      neoteroi-mkdocs \
      \
      markdown-include \
      pygments \
      pymdown-extensions \
    && clean

COPY rootfs /

CMD [ "mkdocs", "serve", "--dev-addr", "0.0.0.0:8000" ]

FROM minidocks/python:3-build AS build

RUN apk add libsass-dev \
    && pip3 wheel --wheel-dir=/tmp libsass

FROM latest AS pdf

COPY --from=build /tmp/libsass* /tmp

RUN apk add libsass && pip install \
      /tmp/libsass* \
      mkdocs-pdf-export-plugin \
      mkdocs-with-pdf \
      mkpdfs-mkdocs \
    && clean

RUN wget -O /tmp/roboto.zip https://fonts.google.com/download?family=Roboto \
    && unzip /tmp/roboto.zip -d /usr/share/fonts/truetype \
    && fc-cache -f \
    && clean

FROM latest
