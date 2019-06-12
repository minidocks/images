FROM minidocks/ffmpeg
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add unpaper && clean

COPY rootfs /

CMD [ "unpaper" ]

