FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV SPHINX_VERSION=1.7.9

RUN pip install \
      sphinx==$SPHINX_VERSION \
      m2r \
      recommonmark \
      phix \
      sphinx_rtd_theme \
      sphinx-autobuild \
      sphinx-multibuild \
      sphinx-tabs \
    && clean

COPY rootfs /

CMD [ "sphinx-build" ]
