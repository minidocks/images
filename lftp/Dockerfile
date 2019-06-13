FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add lftp ncftp && clean

COPY rootfs /

CMD [ "lftp" ]
