FROM minidocks/base:build AS dist

ARG TARGETARCH

ENV PATH=$PATH:/usr/share/tex/texmf/bin:/usr/share/bin

RUN apk add curl && clean

RUN cd /usr/share \
    && export platform="$([ "$TARGETARCH" = "arm64" ] && echo "linux-aarch64" || echo "linuxmusl-64")" \
    && wget -O context.zip https://lmtx.pragma-ade.com/install-lmtx/context-$platform.zip && unzip context.zip && rm context.zip \
    && sh ./install.sh \
    && ln -s "../texmf-$platform/bin" tex/texmf/bin

# Build LuaMetaTeX
RUN cd /usr/share/tex/texmf-context/source/luametatex && sh ./build.sh \
    && mv build/native/luametatex /usr/share/tex/texmf/bin/luametatex \
    && rm -rf build

# Install modules
RUN cd /usr/share/tex && mtxrun --script install-modules --install --all

#RUN mkdir -p /tmp/modules \
#    && wget -P /tmp https://github.com/Witiko/markdown/releases/download/latest/markdown.tds.zip \
#    && mkdir -p /tmp/modules/t-markdown && unzip -d /tmp/modules/t-markdown /tmp/markdown.tds.zip \
#    && rm -rf /tmp/modules/__MACOSX \
#    && rsync -rlt --exclude=/VERSION /tmp/modules/*/ /usr/share/tex/texmf-modules

RUN mkdir -p /usr/share/tex/texmf-modules/doc && mv /usr/share/tex/texmf-modules/doc /usr/share/texmf-modules-doc
RUN mv /usr/share/tex/texmf-context/doc /usr/share/texmf-context-doc
RUN mkdir -p /usr/share/texmf-fonts && for dir in gust public sil ibm stix; do mv "/usr/share/tex/texmf/fonts/data/$dir/" /usr/share/texmf-fonts/; done
RUN rm -rf /usr/share/tex/texmf-cache/*

FROM minidocks/base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG TARGETARCH

ENV CONTEXT_HOME=/usr/share \
    PATH=$PATH:/usr/share/tex/texmf/bin:/usr/share/bin \
    TEXMFCACHE=/usr/share/tex/texmf-cache \
    TEXMF=/usr/share/tex \
    OSFONTDIR=/usr/share/fonts \
    MTX_FONTS_AUTOLOAD=yes

COPY --from=dist /usr/share/bin /usr/share/bin
COPY --from=dist /usr/share/tex /usr/share/tex
COPY --from=minidocks/texlive /usr/local/texlive/bin/x86_64-linuxmusl/luatex /usr/share/bin/luatex

# Fonts
COPY --from=dist /usr/share/texmf-fonts/public/dejavu /usr/share/tex/texmf/fonts/data/public/dejavu
COPY --from=dist /usr/share/texmf-fonts/gust/lm /usr/share/tex/texmf/fonts/data/gust/lm
RUN wget -P /usr/share/fonts http://quivira-font.com/files/Quivira.otf
RUN wget -P /usr/share/fonts https://catrinity-font.de/downloads/Catrinity.otf

# --jit
RUN apk add libgcc && clean

# https://www.contextgarden.net/Barcodes
RUN apk add libpng && clean
COPY --from=minidocks/zint /usr/local/ /usr/local/
RUN export platform="$([ "$TARGETARCH" = "arm64" ] && echo "linux-aarch64" || echo "linuxmusl-64")" \
    && mkdir -p /usr/share/tex/texmf-$platform/bin/lib/luametatex/zint \
    && ln -s /usr/local/lib/libzint.so /usr/share/tex/texmf-$platform/bin/lib/luametatex/zint/libzint.so

RUN context --luatex --generate && context --generate \
    && context --luatex --make && context --make && mtxrun --script fonts --reload \
    && find "$TEXMFCACHE" -type d -exec chmod 777 {} \; \
    && find "$TEXMFCACHE" -type f -exec chmod 666 {} \;

COPY rootfs /

CMD [ "context" ]

FROM latest AS fonts

COPY --from=dist /usr/share/texmf-fonts /usr/share/tex/texmf/fonts

RUN context --make en && mtxrun --script fonts --reload \
    && find "$TEXMFCACHE" -type d -exec chmod 777 {} \; \
    && find "$TEXMFCACHE" -type f -exec chmod 666 {} \;

FROM latest AS docs

COPY --from=dist /usr/share/texmf-context-doc /usr/share/tex/texmf-context/doc
COPY --from=dist /usr/share/texmf-modules-doc /usr/share/tex/texmf-modules/doc

FROM latest
