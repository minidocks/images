FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk --update add wkhtmltopdf@edge xvfb ttf-freefont fontconfig dbus \
    && dbus-uuidgen > /var/lib/dbus/machine-id && apk del dbus \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "wkhtmltopdf" ]

# https://github.com/LoicMahieu/alpine-wkhtmltopdf/blob/master/Dockerfile
# http://www.torkwrench.com/2011/12/16/d-bus-library-appears-to-be-incorrectly-set-up-failed-to-read-machine-uuid-failed-to-open-varlibdbusmachine-id/
