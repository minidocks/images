FROM webuni/base:3.5
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

ENV CADDY_VERSION=0.9.4
ENV CADDYPATH=/.caddy
ARG CADDY_FEATURES=

RUN wget -O /tmp/caddy.tar.gz "https://caddyserver.com/download/build?os=linux&arch=amd64&features=${CADDY_FEATURES}" \
    && tar xvzf /tmp/caddy.tar.gz -C /tmp && mv /tmp/caddy /usr/bin/caddy && rm -rf /tmp/* \
    && chmod a+x /usr/bin/caddy

EXPOSE 80 443 2015

COPY rootfs /

CMD [ "caddy", "--conf", "/etc/Caddyfile", "--log", "stdout" ]
