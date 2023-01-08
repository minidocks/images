FROM minidocks/ghostscript AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add curl imagemagick && clean

COPY rootfs /

CMD [ "convert" ]
