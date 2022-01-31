FROM minidocks/glibc
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=3.3.2

RUN wget -O /usr/bin/pdftk "https://gitlab.com/api/v4/projects/5024297/packages/generic/pdftk-java/v${version}/pdftk" \
    && chmod a+x /usr/bin/pdftk && clean

COPY rootfs /

CMD [ "pdftk" ]
