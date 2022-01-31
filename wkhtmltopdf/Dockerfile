FROM minidocks/base:3.14
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add wkhtmltopdf xvfb ttf-freefont fontconfig dbus \
    && dbus-uuidgen > /var/lib/dbus/machine-id && apk del dbus \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "wkhtmltopdf" ]

# https://github.com/LoicMahieu/alpine-wkhtmltopdf/blob/master/Dockerfile
# http://www.torkwrench.com/2011/12/16/d-bus-library-appears-to-be-incorrectly-set-up-failed-to-read-machine-uuid-failed-to-open-varlibdbusmachine-id/
