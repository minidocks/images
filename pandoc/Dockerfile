ARG verions=2.7.2
FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ENV PANDOC_VERSION=$version

RUN wget -O /tmp/pandoc.tar.gz "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz" \
    && tar -xvzf /tmp/pandoc.tar.gz -C /tmp && mv /tmp/pandoc*/bin/pandoc /usr/local/bin/pandoc \
    && mkdir -p /pandoc/templates && su-exec user ln -s /pandoc /home/user/.pandoc && su-exec user mkdir -p /home/user/.local/share && su-exec user ln -s /pandoc /home/user/.local/share/pandoc \
    && wget -O /tmp/eisvogel.tar.gz https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v1.2.1/Eisvogel-1.2.1.tar.gz \
    && tar -xvzf /tmp/eisvogel.tar.gz -C /pandoc/templates/ && cp /pandoc/templates/eisvogel.tex /pandoc/templates/eisvogel.latex \
    && rm -rf /pandoc/templates/examples && clean

COPY rootfs /

CMD [ "pandoc" ]
