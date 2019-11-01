FROM minidocks/python
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=0.3.3

RUN apk --update add py-pillow && pip install img2pdf==$version && clean

COPY rootfs /

CMD [ "img2pdf" ]
