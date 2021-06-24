FROM minidocks/glibc
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=1353200062

RUN wget -O /usr/bin/pdftk "https://gitlab.com/pdftk-java/pdftk/-/jobs/${version}/artifacts/raw/build/native-image/pdftk" \
    && chmod a+x /usr/bin/pdftk && clean

COPY rootfs /

CMD [ "pdftk" ]
