FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add terraform@edge && clean

COPY rootfs /

CMD [ "terraform" ]
