ARG verions=2.7
FROM minidocks/base:3.9
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ENV PANDOC_VERSION=$version

RUN wget -O /tmp/pandoc.tar.gz "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz" \
    && tar -xvzf /tmp/pandoc.tar.gz -C /tmp && mv /tmp/pandoc*/bin/pandoc /usr/local/bin/pandoc \
    && clean

COPY rootfs /

CMD [ "pandoc" ]
