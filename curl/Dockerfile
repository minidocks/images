FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add curl jq pup libxml2-utils yq-go && clean

COPY rootfs /
