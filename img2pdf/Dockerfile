FROM minidocks/python:3
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=0.4.4

RUN apk add -u py3-pillow py3-pikepdf qpdf qpdf-fix-qdf && pip install img2pdf==$version && clean

COPY rootfs /

CMD [ "img2pdf" ]
