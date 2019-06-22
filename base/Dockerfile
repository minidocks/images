ARG version=3.10

FROM alpine:$version as latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

ENV TEMP=/tmp \
    ENV=/etc/profile \
    CLEAN="/var/cache/apk/:/tmp/"

RUN adduser -u 1000 -S -s /bin/sh -G users user && echo "user:password" | chpasswd 2>/dev/null

COPY rootfs /

RUN sed -i "s/\$ALPINE_RELEASE/$([ 'edge' = "$version" ] && echo "$version" || echo "v$version")/g" /etc/apk/repositories \
    && [ 'edge' = "$version" ] && sed -i 's/@testing //' /etc/apk/repositories || echo "ok" >/dev/null \
    && apk --update add busybox-suid su-exec tini monit inotify-tools dropbear dropbear-scp dropbear-dbclient dropbear-convert ca-certificates gettext libintl ttf-inconsolata \
    && if [ '3.5' = "$version" ]; then apk add wget libressl; fi \
    && if [ 'edge' = "$version" ] || [ "$(echo "$version" | cut -d. -f2)" -gt 6 ]; then apk add busybox-extras; fi \
    && mv /usr/bin/envsubst /usr/local/bin/ \
    && apk del gettext && clean

RUN chmod 600 /etc/monitrc

ENTRYPOINT [ "/docker-entrypoint.sh" ]

FROM latest AS build
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

RUN apk --update upgrade \
    && apk add build-base make cmake automake autoconf libtool && clean

FROM latest
