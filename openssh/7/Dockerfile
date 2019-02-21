FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN rm -rf /bin/ssh /bin/sshd \
    && apk del dropbear-dbclient dropbear-scp \
    && apk --update add openssh-client openssh-server openssh-keysign openssh-keygen openssh-sftp-server \
    && rm -rf /var/cache/apk/* /tmp/*
