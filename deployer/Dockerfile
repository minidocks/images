ARG version=6.8.0

FROM minidocks/php:7.4-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

RUN apk del --no-cache dropbear-scp && apk add bash shadow openssh-client rsync php7-dom php7-zip unzip && clean \
    && wget -O /usr/bin/dep http://deployer.org/releases/v${version}/deployer.phar \
    && chmod a+x /usr/bin/dep

COPY rootfs /

CMD [ "dep" ]
