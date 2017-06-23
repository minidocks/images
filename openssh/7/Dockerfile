FROM webuni/base:3.6
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN rm -rf /bin/ssh \
    && apk del dropbear-dbclient dropbear-scp \
    && apk --update add openssh-client openssh-server openssh-keygen openssh-sftp-server \
    && rm -rf /var/cache/apk/* /tmp/*
