FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV svgcleaner_version=0.9.5

RUN wget -O /tmp/svgcleaner.tar.gz "https://github.com/RazrFalcon/svgcleaner/releases/download/v${svgcleaner_version}/svgcleaner_linux_x86_64_${svgcleaner_version}.tar.gz" \
    && tar -xvzf /tmp/svgcleaner.tar.gz -C /tmp && mv /tmp/svgcleaner /usr/local/bin && clean

COPY rootfs /

CMD [ "svgcleaner" ]
