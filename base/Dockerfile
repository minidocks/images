ARG version=3.16

FROM alpine:$version as latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

ENV TEMP=/tmp \
    ENV=/etc/profile \
    CLEAN="/var/cache/apk/:/tmp/" \
    RAWEXEC="monit crond supervise sshd"

RUN adduser -u 1000 -S -s /bin/sh -G users user && echo "user:password" | chpasswd 2>/dev/null

COPY rootfs /

RUN sed -i "s/\$ALPINE_RELEASE/$([ 'edge' = "$version" ] && echo "$version" || echo "v$version")/g" /etc/apk/repositories \
    && [ 'edge' = "$version" ] && sed -i 's/@testing //' /etc/apk/repositories || echo "ok" >/dev/null \
    && apk add -u busybox-extras busybox-suid su-exec inotify-tools dropbear dropbear-scp dropbear-dbclient dropbear-convert ca-certificates gettext libc6-compat libintl ttf-inconsolata tini monit \
    && mv /usr/bin/envsubst /usr/local/bin/ \
    && apk del gettext \
    && wget -O /bin/wait-for https://raw.githubusercontent.com/eficode/wait-for/v2.2.3/wait-for && chmod a+x /bin/wait-for \
    && clean

RUN chmod 600 /etc/monitrc

ENTRYPOINT [ "/docker-entrypoint.sh" ]

FROM latest AS build
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

RUN apk --update upgrade \
    && apk add -u build-base make cmake automake autoconf libtool && clean

FROM latest
