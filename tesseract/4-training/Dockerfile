FROM minidocks/tesseract:4
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update --no-cache add cairo pango \
    && rm -rf /var/cache/apk/*
