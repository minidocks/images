FROM minidocks/ffmpeg
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG package="chromium@edge harfbuzz@edge"

RUN apk --update add $package mesa-egl mesa-gles freetype@edge nss@edge ttf-freefont@edge && clean

COPY rootfs /

CMD ["chromium-browser", "--headless", "--disable-gpu", "--disable-software-rasterizer", "--disable-dev-shm-usage"]
