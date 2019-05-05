ARG packages=gimp

FROM minidocks/librsvg
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG packages

RUN apk --update add $packages && clean

RUN mkdir -p /gimp && chmod 777 /gimp && mv /etc/gimp/2.0/gimprc /etc/gimp/2.0/gimprc.dist

COPY rootfs /

CMD [ "gimp" ]
