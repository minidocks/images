FROM minidocks/php:7.2-base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV DEPLOYER_VERSION=6.3.0

RUN apk del dropbear-scp && apk --update add bash shadow openssh-client rsync php7-dom && clean \
    && wget -O /usr/bin/dep http://deployer.org/releases/v${DEPLOYER_VERSION}/deployer.phar \
    && chmod a+x /usr/bin/dep

COPY rootfs /

CMD [ "dep" ]
