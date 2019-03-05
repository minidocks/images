FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=0.3.3
ENV IMG2PDF_VERSION=$version

RUN apk --update add py-pillow && pip install img2pdf==$IMG2PDF_VERSION && clean

COPY rootfs /

CMD [ "img2pdf" ]
