ARG version=3.12
ARG glibc_version="2.31-r0"
ARG prefix="https://github.com/sgerrand/alpine-pkg-glibc/releases/download/"

FROM minidocks/base:$version as latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG prefix
ARG glibc_version

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget "$prefix/$glibc_version/glibc-$glibc_version.apk" && apk --no-cache add "glibc-$glibc_version.apk" && rm "glibc-$glibc_version.apk" \
    && wget "$prefix/$glibc_version/glibc-bin-$glibc_version.apk" && apk --no-cache add "glibc-bin-$glibc_version.apk" && rm "glibc-bin-$glibc_version.apk" \
    && clean

FROM latest AS i18n
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG prefix
ARG glibc_version

RUN wget "$prefix/$glibc_version/glibc-i18n-$glibc_version.apk" && apk --no-cache add "glibc-i18n-$glibc_version.apk" && rm "glibc-i18n-$glibc_version.apk" \
    && clean

FROM i18n AS dev

ARG prefix
ARG glibc_version

RUN wget "$prefix/$glibc_version/glibc-dev-$glibc_version.apk" && apk --no-cache add "glibc-dev-$glibc_version.apk" && rm "glibc-dev-$glibc_version.apk" \
    && clean

FROM latest
