FROM minidocks/poppler
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add ghostscript && clean

COPY rootfs /

CMD [ "gs" ]
