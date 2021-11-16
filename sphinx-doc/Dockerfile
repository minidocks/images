ARG base_image=python

FROM minidocks/python AS python

FROM minidocks/weasyprint AS weasyprint

FROM $base_image AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=4.3.0

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
      sphinx-design \
      sphinx-inline-tabs \
      sphinx-multitoc-numbering \
      sphinx-multiversion \
      sphinx-panels \
      sphinx-prompt \
      sphinx-sitemap \
      sphinx-tabs \
      sphinx-togglebutton \
      sphinx-toolbox \
      sphinxcontrib.programoutput \
      \
      sphinxcontrib-kroki \
      sphinxcontrib-scm \
      sphinxcontrib-svg2pdfconverter \
      sphinxcontrib-images \
      sphinxcontrib-openapi \
      sphinxcontrib-programoutput \
      sphinx_gherkindoc \
      sphinxext-opengraph \
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
      mdformat-myst \
      myst-parser \
      linkify-it-py \
      sphinx-markdown-parser \
      pymdown-extensions \
      recommonmark \
      rstvalidator \
      rst-to-myst \
    && clean

COPY rootfs /

CMD [ "sphinx-build" ]

FROM latest AS pdf

RUN apk add py3-reportlab \
    && pip install rst2pdf sphinx-business-theme sphinx-weasyprint-builder \
    && clean

FROM latest
