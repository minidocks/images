ARG verions=2.8.0.1
FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ENV PANDOC_VERSION=$version \
    XDG_DATA_HOME=/

RUN wget -O /tmp/pandoc.tar.gz "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz" \
    && tar -xvzf /tmp/pandoc.tar.gz -C /tmp && mv /tmp/pandoc*/bin/pandoc /usr/local/bin/pandoc && clean

RUN mkdir -p /pandoc/templates \
    && wget -O /pandoc/templates/eisvogel.latex https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/v1.2.2/eisvogel.tex \
    && wget -O /pandoc/templates/template-letter.tex https://raw.githubusercontent.com/aaronwolen/pandoc-letter/master/template-letter.tex \
    && wget -O /pandoc/templates/chmduquesne.tex https://raw.githubusercontent.com/mszep/pandoc_resume/master/styles/chmduquesne.tex \
    && wget -O /pandoc/templates/chmduquesne.css https://raw.githubusercontent.com/mszep/pandoc_resume/master/styles/chmduquesne.css \
    && chown -R user:users /pandoc \
    && clean

COPY rootfs /

CMD [ "pandoc" ]
