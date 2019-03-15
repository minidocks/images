ARG version=beta

FROM minidocks/base

ARG version

RUN apk --update --no-cache add rsync
RUN cd /usr/share && wget http://minimals.contextgarden.net/setup/first-setup.sh
RUN cd /usr/share && sh ./first-setup.sh --modules=all --engine=luatex --context="$version"
RUN mv /usr/share/tex/texmf-modules/doc /usr/share/texmf-modules-doc
RUN mv /usr/share/tex/texmf-context/doc /usr/share/texmf-context-doc
RUN mkdir -p /usr/share/texmf-fonts && for dir in truetype type1 opentype; do mv "/usr/share/tex/texmf/fonts/$dir/" /usr/share/texmf-fonts/; done
RUN rm -rf /usr/share/tex/texmf-cache/*

FROM minidocks/base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV CONTEXT_HOME=/usr/share \
    PATH=$PATH:/usr/share/tex/texmf-linuxmusl-64/bin \
    TEXMFCACHE=/usr/share/tex/texmf-cache \
    MTX_FONTS_AUTOLOAD=yes

COPY --from=0 /usr/share/tex /usr/share/tex
COPY --from=0 /usr/share/texmf-fonts/opentype/public/lm /usr/share/tex/texmf/fonts/opentype/public/lm

RUN mtxrun --generate && context --make cont-en && mtxrun --script fonts --reload \
    && find "$TEXMFCACHE" -type d -exec chmod 777 {} \; \
    && find "$TEXMFCACHE" -type f -exec chmod 666 {} \;

COPY rootfs /

CMD [ "context" ]

FROM latest AS fonts

COPY --from=0 /usr/share/texmf-fonts /usr/share/tex/texmf/fonts

RUN context --make cont-en && mtxrun --script fonts --reload \
    && find "$TEXMFCACHE" -type d -exec chmod 777 {} \; \
    && find "$TEXMFCACHE" -type f -exec chmod 666 {} \;

FROM latest AS docs

COPY --from=0 /usr/share/texmf-context-doc /usr/share/tex/texmf-context/doc
COPY --from=0 /usr/share/texmf-modules-doc /usr/share/tex/texmf-modules/doc

FROM latest
