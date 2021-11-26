FROM minidocks/ffmpeg AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add chromium mesa-egl mesa-gles ttf-freefont font-noto-emoji && clean

COPY rootfs /

CMD ["chromium-browser", "--headless", "--disable-gpu", "--disable-software-rasterizer", "--disable-dev-shm-usage"]

FROM latest AS webdriver

RUN apk add chromium-chromedriver && clean

FROM latest
