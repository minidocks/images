FROM minidocks/base AS dist

ARG TARGETARCH

ENV PATH=$PATH:/usr/share/tex/texmf/bin:/usr/share/bin

RUN apk --no-cache add curl rsync && clean

RUN cd /usr/share \
    && export platform="$([ "$TARGETARCH" = "arm64" ] && echo "linux-aarch64" || echo "linuxmusl")" \
    && wget -O context.zip https://lmtx.pragma-ade.com/install-lmtx/context-$platform.zip && unzip context.zip && rm context.zip \
    && chmod a+x install.sh bin/mtxrun && mkdir -p tex \
    && ./install.sh \
    && ln -s "../texmf-$platform/bin" tex/texmf/bin

# Install modules
RUN cd /usr/share/tex && mtxrun --script install-modules --install --all

RUN mkdir -p /tmp/modules \
    && wget -P /tmp https://github.com/Witiko/markdown/releases/download/latest/markdown.tds.zip \
    && wget -P /tmp https://mirrors.ctan.org/install/macros/luatex/generic/lua-widow-control.tds.zip \
    && mkdir -p /tmp/modules/t-markdown && unzip -d /tmp/modules/t-markdown /tmp/markdown.tds.zip \
    && mkdir -p /tmp/modules/t-lua-widow-control && unzip -d /tmp/modules/t-lua-widow-control /tmp/lua-widow-control.tds.zip \
    && rm -rf /tmp/modules/__MACOSX \
    && rsync -rlt --exclude=/VERSION /tmp/modules/*/ /usr/share/tex/texmf-modules

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
    OSFONTDIR=/usr/share/fonts \
    MTX_FONTS_AUTOLOAD=yes

COPY --from=dist /usr/share/bin /usr/share/bin
COPY --from=dist /usr/share/tex /usr/share/tex

COPY --from=dist /usr/share/texmf-fonts/public/dejavu /usr/share/tex/texmf/fonts/data/public/dejavu
COPY --from=dist /usr/share/texmf-fonts/gust/lm /usr/share/tex/texmf/fonts/data/gust/lm

# --jit
RUN apk add libgcc && wget -P /usr/share/fonts http://quivira-font.com/files/Quivira.otf && clean

# https://www.contextgarden.net/Barcodes
RUN apk add libpng && clean
COPY --from=minidocks/zint /usr/local/ /usr/local/
RUN export platform="$([ "$TARGETARCH" = "arm64" ] && echo "linux-aarch64" || echo "linuxmusl")" \
    && mkdir -p /usr/share/tex/texmf-$platform/bin/lib/luametatex/zint \
    && ln -s /usr/local/lib/libzint.so /usr/share/tex/texmf-$platform/bin/lib/luametatex/zint/libzint.so

RUN mtxrun --generate && context --make en && mtxrun --script fonts --reload \
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
