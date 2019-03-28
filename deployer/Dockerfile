ARG version=6.4.3

FROM minidocks/php:7.3-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

RUN apk del --no-cache dropbear-scp && apk add bash shadow openssh-client rsync php7-dom && clean \
    && wget -O /usr/bin/dep http://deployer.org/releases/v${version}/deployer.phar \
    && chmod a+x /usr/bin/dep

COPY rootfs /

CMD [ "dep" ]
