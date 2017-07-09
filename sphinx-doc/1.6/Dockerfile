FROM webuni/python:3.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN pip install \
      sphinx \
      recommonmark \
      sphinx_rtd_theme \
    && rm -rf /root/.cache/pip && find /usr/lib/python3.6 -name '*.pyc' -delete

COPY rootfs /

CMD [ "sphinx-build" ]
