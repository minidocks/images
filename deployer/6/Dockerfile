FROM webuni/php:7.1-base
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

ENV DEPLOYER_VERSION 6.0.3

RUN apk del dropbear-scp && apk --update add bash shadow openssh-client php7-dom \
    && rm -rf /bin/ssh /var/cache/apk/* /tmp/* \
    && chsh -s /bin/bash \
    && wget -O /usr/bin/dep http://deployer.org/releases/v${DEPLOYER_VERSION}/deployer.phar \
    && chmod a+x /usr/bin/dep

COPY rootfs /

CMD [ "dep" ]
