ARG version=9.1.1
ARG qpdf_version=9.1.0

FROM minidocks/python:3-build

RUN apk --update add jpeg-dev zlib-dev libjpeg-turbo-dev

ARG qpdf_version

RUN wget -O /tmp/qpdf.tar.gz "https://github.com/qpdf/qpdf/releases/download/release-qpdf-${qpdf_version}/qpdf-${qpdf_version}.tar.gz" \
    && tar -xzf /tmp/qpdf.tar.gz -C /tmp && cd /tmp/qpdf* \
    && ./configure --disable-static && make && make install && mkdir -p /tmp/build && make DESTDIR=/tmp/build install

RUN apk --update add py-defusedxml py-lxml freetype-dev libwebp-dev tiff-dev libpng-dev lcms2-dev libxml2-dev libxslt-dev py3-pybind11

RUN mkdir -p /tmp/build/usr && pip3 install --install-option="--prefix=/tmp/build/usr" pikepdf

RUN mkdir -p /tmp/build/usr && pip3 install --install-option="--prefix=/tmp/build/usr" pycryptodome

RUN find "/tmp/build" -type f -name \*.pyc -o -name \*.pyo -o -name __pycache__ | xargs rm -rf

FROM minidocks/img2pdf
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

COPY --from=0 /tmp/build /

COPY rootfs /

RUN apk -U add py-cffi py3-defusedxml py3-lxml py3-pillow py3-reportlab libjpeg-turbo zlib pngquant jbig2enc@edge && clean

RUN pip install ocrmypdf==$version && clean

CMD [ "ocrmypdf" ]
