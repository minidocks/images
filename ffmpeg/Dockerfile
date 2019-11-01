ARG version=4

FROM minidocks/base:3.8 AS v3

FROM minidocks/base AS v4

FROM v$version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add ffmpeg ffmpegthumbnailer && clean

COPY rootfs /

CMD [ "ffmpeg" ]
