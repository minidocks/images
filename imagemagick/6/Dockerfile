FROM minidocks/ghostscript:9
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add curl imagemagick6 && clean

COPY rootfs /

CMD [ "convert" ]
