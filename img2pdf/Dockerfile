FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=0.4.0

RUN if [ ! "${version%.*}" = "0.3" ]; then packages="py3-pikepdf@edge qpdf qpdf-fix-qdf"; fi \
    && apk --update add py3-pillow $packages && pip install img2pdf==$version && clean

COPY rootfs /

CMD [ "img2pdf" ]
