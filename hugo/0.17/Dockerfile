FROM webuni/base:3.4
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

ENV HUGO_VERSION=0.17

RUN wget -O /tmp/hugo.tar.gz https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && tar xvzf /tmp/hugo.tar.gz -C /tmp && mv /tmp/hugo*/hugo* /usr/bin/hugo && rm -rf /tmp/* \
    && chmod a+x /usr/bin/hugo

COPY rootfs /

CMD [ "hugo" ]
