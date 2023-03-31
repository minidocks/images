FROM minidocks/librsvg
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add libreoffice && clean

COPY rootfs /

CMD [ "libreoffice" ]
