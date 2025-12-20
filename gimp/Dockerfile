FROM minidocks/librsvg
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add gimp && clean

RUN mkdir -p /gimp && chmod 777 /gimp && mv /etc/gimp/3.0/gimprc /etc/gimp/3.0/gimprc.dist

COPY rootfs /

CMD [ "gimp" ]
