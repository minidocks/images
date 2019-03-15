ARG version=8.2.0
FROM minidocks/base:3.9-build

RUN apk --update add python3-dev py-defusedxml py-lxml qpdf-dev libxml2-dev libxslt-dev py3-pybind11@testing

RUN pip3 install wheel pikepdf
RUN pip3 wheel --no-deps --wheel-dir=/tmp/wheelhouse pikepdf

FROM minidocks/img2pdf
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ENV OCRMYPDF_VERSION=$version

COPY --from=0 /tmp/wheelhouse/* /tmp/

COPY rootfs /

RUN apk -U add py-cffi py3-defusedxml py3-lxml py3-reportlab qpdf pngquant py3-pycryptodome@testing jbig2enc@testing \
    && pip install /tmp/*.whl ocrmypdf==$OCRMYPDF_VERSION && clean \
    && patch /usr/lib/python3.6/site-packages/ocrmypdf/pdfa.py /root/pdfa.patch

CMD [ "ocrmypdf" ]
