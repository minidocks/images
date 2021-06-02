ARG base_image=python

FROM minidocks/python AS python

FROM minidocks/weasyprint AS weasyprint

FROM $base_image AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=4.0.2

RUN apk add py3-lxml py3-beautifulsoup4 && pip install \
      sphinx=="$version" \
      \
      sphinx-autobuild \
      sphinx-multibuild \
      \
      sphinx-markdown-builder \
      sphinxcontrib-confluencebuilder \
      \
      sphinx-comments \
      sphinx-copybutton \
      sphinx-inline-tabs \
      sphinx-multitoc-numbering \
      sphinx-multiversion \
      sphinx-panels \
      sphinx-prompt \
      sphinx-sitemap \
      sphinx-tabs \
      sphinx-togglebutton \
      sphinxcontrib.programoutput \
      \
      sphinxcontrib-kroki \
      sphinxcontrib-scm \
      sphinxcontrib-svg2pdfconverter \
      sphinxcontrib-images \
      sphinxcontrib-programoutput \
      sphinx_gherkindoc \
      \
      furo \
      Pallets-Sphinx-Themes \
      sphinxawesome-theme \
      sphinx-book-theme \
      sphinx-documatt-theme \
      sphinx-material \
      sphinx_press_theme \
      pydata-sphinx-theme \
      sphinx_rtd_theme \
      \
      m2r2 \
      mdformat \
      myst-parser \
      linkify-it-py \
      sphinx-markdown-parser \
      pymdown-extensions \
      recommonmark \
      rstvalidator \
    && clean

COPY rootfs /

CMD [ "sphinx-build" ]

FROM latest AS pdf

RUN apk add py3-reportlab \
    && pip install rst2pdf sphinx-business-theme sphinx-weasyprint-builder \
    && clean

FROM latest
