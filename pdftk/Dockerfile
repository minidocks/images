FROM minidocks/glibc
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=3.2.2

RUN wget -O /tmp/pdftk.zip "https://gitlab.com/pdftk-java/pdftk/-/jobs/artifacts/v${version}/file/build/native-image/pdftk?job=nativeimage" \
    && unzip /tmp/pdftk.zip -d /tmp && mv /tmp/build/*/pdftk /usr/bin && clean

COPY rootfs /

CMD [ "pdftk" ]
