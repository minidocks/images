FROM webuni/base:3.5
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

ENV CADDY_VERSION=0.10.2
ENV CADDYPATH=/caddy
ARG CADDY_PLUGINS=

RUN wget -O /tmp/caddy.tar.gz "https://caddyserver.com/download/linux/amd64?plugins=${CADDY_PLUGINS}" \
    && tar xvzf /tmp/caddy.tar.gz -C /tmp && mv /tmp/caddy /usr/bin/caddy && rm -rf /tmp/* \
    && chmod a+x /usr/bin/caddy

EXPOSE 80 443 2015

COPY rootfs /

CMD [ "caddy", "--conf", "/etc/Caddyfile", "--log", "stdout" ]
