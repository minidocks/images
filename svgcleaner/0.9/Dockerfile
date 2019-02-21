FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV SVGCLEANER_VERSION=0.9.5

RUN wget -O /tmp/svgcleaner.tar.gz "https://github.com/RazrFalcon/svgcleaner/releases/download/v0.9.5/svgcleaner_linux_x86_64_${SVGCLEANER_VERSION}.tar.gz" \
    && tar -xvzf /tmp/svgcleaner.tar.gz -C /tmp && mv /tmp/svgcleaner /usr/local/bin && clean

COPY rootfs /

CMD [ "svgcleaner" ]
