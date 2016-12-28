FROM webuni/python:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN pip install sphinx \
      recommonmark \
    && rm -rf /root/.cache/pip && find /usr/lib/python3.5 -name '*.pyc' -delete

ADD rootfs /

CMD [ "sphinx-build" ]
