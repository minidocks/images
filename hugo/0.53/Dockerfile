FROM minidocks/base:3.8
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

ENV HUGO_VERSION=0.53

RUN wget -O /tmp/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz \
    && tar xvzf /tmp/hugo.tar.gz -C /tmp && mv /tmp/hugo /usr/bin/hugo && clean

COPY rootfs /

CMD [ "hugo" ]
