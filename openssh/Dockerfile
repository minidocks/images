FROM minidocks/base

LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk del dropbear-dbclient dropbear-scp \
    && apk --update add openssh-client openssh-server openssh-keysign openssh-keygen openssh-sftp-server \
    && clean
