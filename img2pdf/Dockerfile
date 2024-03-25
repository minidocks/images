FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add -u py3-pillow py3-lxml qpdf qpdf-fix-qdf && pip install img2pdf && clean

COPY rootfs /

CMD [ "img2pdf" ]
