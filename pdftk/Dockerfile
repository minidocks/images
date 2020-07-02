FROM minidocks/glibc
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=3.1.3

RUN wget -O /usr/bin/pdftk "https://gitlab.com/pdftk-java/pdftk/-/jobs/artifacts/v${version}/download?job=nativeimage" \
    && chmod a+x /usr/bin/pdftk

COPY rootfs /

CMD [ "pdftk" ]
