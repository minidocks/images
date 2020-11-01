FROM minidocks/base:11 AS v4.8

FROM minidocks/base:12 AS v4.9

FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add lftp ncftp && clean

COPY rootfs /

CMD [ "lftp" ]
