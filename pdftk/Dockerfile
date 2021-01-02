FROM minidocks/glibc
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=924565150

RUN wget -O /tmp/pdftk.zip "https://gitlab.com/pdftk-java/pdftk/-/jobs/${version}/artifacts/raw/build/native-image/pdftk" \
    && unzip /tmp/pdftk.zip -d /tmp && mv /tmp/build/*/pdftk /usr/bin && clean

COPY rootfs /

CMD [ "pdftk" ]
