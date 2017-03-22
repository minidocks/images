FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
    && apk --update add wkhtmltopdf xvfb ttf-freefont fontconfig dbus \
    && dbus-uuidgen > /var/lib/dbus/machine-id && apk del dbus \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mv /usr/bin/wkhtmltopdf /usr/bin/wkhtmltopdf-origin
COPY rootfs /

CMD [ "wkhtmltopdf" ]

# https://github.com/LoicMahieu/alpine-wkhtmltopdf/blob/master/Dockerfile
# http://www.torkwrench.com/2011/12/16/d-bus-library-appears-to-be-incorrectly-set-up-failed-to-read-machine-uuid-failed-to-open-varlibdbusmachine-id/
