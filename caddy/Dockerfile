FROM minidocks/base
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

ENV CADDYPATH=/caddy
ARG plugins

RUN wget -O /tmp/caddy.tar.gz "https://caddyserver.com/download/linux/amd64?license=personal&telemetry=on&plugins=${plugins}" \
    && tar xvzf /tmp/caddy.tar.gz -C /tmp && mv /tmp/caddy /usr/bin/caddy \
    && chmod a+x /usr/bin/caddy && clean

EXPOSE 80 443 2015

COPY rootfs /

CMD [ "caddy", "--conf", "/etc/Caddyfile", "--log", "stdout" ]
