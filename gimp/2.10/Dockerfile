FROM webuni/poppler
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk --update add gimp && clean

RUN mkdir -p /gimp && chmod 777 /gimp && mv /etc/gimp/2.0/gimprc /etc/gimp/2.0/gimprc.dist

COPY rootfs /

CMD [ "gimp" ]
