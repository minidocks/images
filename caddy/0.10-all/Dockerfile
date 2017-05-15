FROM webuni/base:3.5
MAINTAINER Martin Hasoň <martin.hason@gmail.com>

ENV CADDY_VERSION=0.10.2
ENV CADDYPATH=/caddy
ARG CADDY_PLUGINS=dns,hook.service,http.awslambda,http.cgi,http.cors,http.datadog,http.expires,http.filemanager,http.filter,http.git,http.hugo,http.ipfilter,http.jwt,http.mailout,http.minify,http.prometheus,http.proxyprotocol,http.ratelimit,http.realip,http.upload,net,tls.dns.cloudflare,tls.dns.digitalocean,tls.dns.dnsimple,tls.dns.dnspod,tls.dns.dyn,tls.dns.exoscale,tls.dns.gandi,tls.dns.googlecloud,tls.dns.linode,tls.dns.namecheap,tls.dns.ovh,tls.dns.rackspace,tls.dns.rfc2136,tls.dns.route53,tls.dns.vultr

RUN wget -O /tmp/caddy.tar.gz "https://caddyserver.com/download/linux/amd64?plugins=${CADDY_PLUGINS}" \
    && tar xvzf /tmp/caddy.tar.gz -C /tmp && mv /tmp/caddy /usr/bin/caddy && rm -rf /tmp/* \
    && chmod a+x /usr/bin/caddy

EXPOSE 80 443 2015

COPY rootfs /

CMD [ "caddy", "--conf", "/etc/Caddyfile", "--log", "stdout" ]
