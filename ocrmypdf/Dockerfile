ARG version=8.3.1
ARG qpdf_version=8.4.2

FROM minidocks/base:build

RUN apk --update add python3-dev py-defusedxml py-lxml libjpeg-turbo-dev zlib-dev libxml2-dev libxslt-dev py3-pybind11@edge

ARG qpdf_version

RUN wget -O /tmp/qpdf.tar.gz "https://github.com/qpdf/qpdf/releases/download/release-qpdf-${qpdf_version}/qpdf-${qpdf_version}.tar.gz" \
    && tar -xzf /tmp/qpdf.tar.gz -C /tmp && cd /tmp/qpdf* \
    && ./configure --disable-static && make && make install && mkdir -p /tmp/build && make DESTDIR=/tmp/build install

RUN mkdir -p /tmp/build/usr && pip3 install --install-option="--prefix=/tmp/build/usr" pikepdf

RUN mkdir -p /tmp/build/usr && pip3 install --install-option="--prefix=/tmp/build/usr" pycryptodome

RUN find "/tmp/build" -type f -name \*.pyc -o -name \*.pyo -o -name __pycache__ | xargs rm -rf

FROM minidocks/img2pdf
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ENV OCRMYPDF_VERSION=$version

COPY --from=0 /tmp/build /

COPY rootfs /

RUN apk -U add py-cffi py3-defusedxml py3-lxml py3-reportlab libjpeg-turbo zlib pngquant jbig2enc@edge && clean

RUN pip install ocrmypdf==$OCRMYPDF_VERSION && clean \
    && patch "$(pip show ocrmypdf | grep Location | cut -d' ' -f2-)/ocrmypdf/pdfa.py" /root/pdfa.py.patch

CMD [ "ocrmypdf" ]
