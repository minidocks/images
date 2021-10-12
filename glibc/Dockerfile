ARG version=3.14
ARG glibc_version="2.34-r0"
ARG prefix="https://github.com/sgerrand/alpine-pkg-glibc/releases/download/"

FROM minidocks/base:$version as latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG prefix
ARG glibc_version

# FIXME https://github.com/sgerrand/alpine-pkg-glibc/issues/145
# wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
COPY rootfs /

# https://github.com/sgerrand/alpine-pkg-glibc/issues/119#issuecomment-626627458
RUN cd /tmp \
    && wget "$prefix/$glibc_version/glibc-$glibc_version.apk" && wget "$prefix/$glibc_version/glibc-bin-$glibc_version.apk" \
    && apk add --allow-untrusted "glibc-$glibc_version.apk" \
    && ln -svf /usr/glibc-compat/lib/ld-${glibc_version%%-*}.so /usr/glibc-compat/lib/ld-linux-x86-64.so.2 \
    && apk add --allow-untrusted "glibc-bin-$glibc_version.apk" \
    && clean

FROM latest AS i18n
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG prefix
ARG glibc_version

RUN cd /tmp \
    && wget "$prefix/$glibc_version/glibc-i18n-$glibc_version.apk" && apk add "glibc-i18n-$glibc_version.apk" \
    && clean

FROM i18n AS dev

ARG prefix
ARG glibc_version

RUN cd /tmp \
    && wget "$prefix/$glibc_version/glibc-dev-$glibc_version.apk" && apk add "glibc-dev-$glibc_version.apk" \
    && clean

FROM latest
