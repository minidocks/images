FROM minidocks/img2pdf
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

COPY rootfs /

RUN apk -U add py3-cffi py3-cryptography py3-defusedxml py3-reportlab libjpeg-turbo zlib pngquant jbig2enc && clean

RUN pip install ocrmypdf hocr-tools && clean

CMD [ "ocrmypdf" ]
