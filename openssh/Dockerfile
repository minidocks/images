ARG version=8

FROM minidocks/base:3.9 AS base7

FROM minidocks/base AS base8

FROM base${version}
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk del dropbear-dbclient dropbear-scp \
    && apk --update add openssh-client openssh-server openssh-keysign openssh-keygen openssh-sftp-server \
    && clean
