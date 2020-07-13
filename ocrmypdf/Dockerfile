ARG version=10.2.0

FROM minidocks/python:3-build

RUN apk --update add jpeg-dev zlib-dev libjpeg-turbo-dev qpdf-dev
RUN apk --update add py-defusedxml py-lxml freetype-dev libwebp-dev tiff-dev libpng-dev lcms2-dev libxml2-dev libxslt-dev py3-pybind11-dev py3-pillow

RUN mkdir -p /tmp/build/usr && pip3 install --prefix=/tmp/build/usr pikepdf

RUN mkdir -p /tmp/build/usr && pip3 install --prefix=/tmp/build/usr pycryptodome

RUN find "/tmp/build" -type f -name \*.pyc -o -name \*.pyo -o -name __pycache__ | xargs rm -rf

FROM minidocks/img2pdf
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

COPY --from=0 /tmp/build /

COPY rootfs /

RUN apk -U add py-cffi py3-defusedxml py3-lxml py3-pillow py3-reportlab libjpeg-turbo zlib pngquant jbig2enc qpdf qpdf-fix-qdf && clean

RUN pip install ocrmypdf==$version hocr-tools && clean

CMD [ "ocrmypdf" ]
