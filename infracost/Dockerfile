ARG INFRACOST_VERSION=0.9.16

FROM minidocks/curl
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG TARGETARCH
ARG INFRACOST_VERSION

RUN apk --update add bash && clean

RUN wget -O /tmp/ic.tar.gz "https://github.com/infracost/infracost/releases/download/v${INFRACOST_VERSION}/infracost-$([ "$TARGETARCH" == "arm64" ] && echo "darwin" || echo "linux")-${TARGETARCH}.tar.gz" \
    && tar -C /tmp -xzf /tmp/ic.tar.gz && mv /tmp/infracost* /usr/local/bin/infracost && clean

RUN wget -O /tmp/ic.tar.gz "https://github.com/infracost/infracost/archive/refs/tags/v${INFRACOST_VERSION}.tar.gz" \
    && tar -C /tmp -xzf /tmp/ic.tar.gz && mv /tmp/infra*/scripts / && clean

COPY rootfs /

CMD [ "infracost" ]
