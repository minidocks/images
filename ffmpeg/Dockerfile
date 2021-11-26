ARG version=4

FROM minidocks/base AS v4

FROM v$version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add ffmpeg ffmpegthumbnailer && clean

COPY rootfs /

CMD [ "ffmpeg" ]
