FROM minidocks/python:3.9
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=0.4.1

RUN if [ ! "${version%.*}" = "0.3" ]; then packages="py3-pikepdf qpdf qpdf-fix-qdf"; fi \
    && apk --update add py3-pillow $packages && pip install img2pdf==$version && clean

COPY rootfs /

CMD [ "img2pdf" ]
