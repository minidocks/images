FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=3.2.1

RUN apk add py3-lxml py3-beautifulsoup4 && pip install \
      sphinx=="$version" \
      \
      sphinx-autobuild \
      sphinx-multibuild \
      sphinx-markdown-builder \
      \
      sphinx-comments \
      sphinx-copybutton \
      sphinx-multiversion \
      sphinx-panels \
      sphinx-prompt \
      sphinx-tabs \
      sphinx-togglebutton \
      sphinxcontrib.programoutput \
      \
      sphinxcontrib-kroki \
      sphinxcontrib-svg2pdfconverter \
      \
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
      myst-parser \
      sphinx-markdown-parser \
      pymdown-extensions \
      recommonmark \
      rstvalidator \
    && clean

COPY rootfs /

CMD [ "sphinx-build" ]
