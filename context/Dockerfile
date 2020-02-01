ARG version=beta
ARG platform=linuxmusl-64

FROM minidocks/base AS build

ARG version
ARG platform

RUN if [ "$version" = "lmtx" ]; then cd /usr/local && rm -rf bin/* && wget -O context.zip http://lmtx.pragma-ade.nl/install-lmtx/context-linux-64.zip && unzip context.zip \
    && wget -O bin/luametatex http://dl.contextgarden.net/build/luametatex/x86_64-linuxmusl/luametatex && chmod +x bin/luametatex && ln -sf luametatex bin/mtxrun \
    && sed -i 's#pdir)#pdir)\n    run("cp -r %s %s", "/usr/local/bin", binpath)#' /usr/local/bin/mtx-install.lua; fi

RUN if [ "$version" = "lmtx" ]; then ln -sf luametatex /usr/local/bin/context \
    && echo -e 'local selfpath = os.selfpath \n if not arg or not selfpath then \n print("invalid stub") \n os.exit() \n end \n arg[0] = "mtxrun" \n table.insert(arg,1,"mtx-context") \n table.insert(arg,1,"--script") \n dofile(selfpath .. "/" .. "mtxrun.lua") \n' > /usr/local/bin/context.lua; fi

RUN if [ "$version" = "lmtx" ]; then cd /usr/share && mtxrun --script /usr/local/bin/mtx-install.lua --update --platform=$platform --erase; fi

#ENV PATH=$PATH:/usr/share/bin

RUN if [ "$version" != "lmtx" ]; then apk --update --no-cache add rsync; fi

#Bug https://mailman.ntg.nl/pipermail/ntg-context/2019/095184.html
#RUN cd /usr/share && wget http://minimals.contextgarden.net/setup/first-setup.sh
#RUN cd /usr/share && sh ./first-setup.sh --modules=all --engine=luatex --context="$version"

RUN if [ "$version" != "lmtx" ]; then rsync -rlptv rsync://contextgarden.net/minimals/setup/$platform/bin /usr/local; fi
RUN if [ "$version" != "lmtx" ]; then cd /usr/local/bin && wget -O luatex-bin-x86_64-musl.tar.gz https://github.com/TeX-Live/luatex/releases/download/1.11.2-svn7226/luatex-bin-x86_64-musl.tar.gz \
    && tar -xzvf luatex-bin-x86_64-musl.tar.gz && rm -rf *.gz; fi
RUN if [ "$version" != "lmtx" ]; then mkdir -p /usr/share/tex && cd /usr/share/tex && CONTEXTROOT=/usr/share/tex PATH="$CONTEXTROOT/texmf-$platform/bin:$PATH" MTX_PLATFORM="$platform" \
    mtxrun --script /usr/local/bin/mtx-update.lua --force --update --make --context=$version --engine=luatex --modules=all --platform="$platform" --texroot="$CONTEXTROOT"; fi

#Bug https://mailman.ntg.nl/pipermail/ntg-context/2019/095184.html
RUN if [ "$version" != "lmtx" ]; then cp /usr/local/bin/luatex /usr/share/tex/texmf-$platform/bin && cp /usr/local/bin/luajittex /usr/share/tex/texmf-$platform/bin; fi

FROM build AS dist

RUN mv /usr/share/tex/texmf-modules/doc /usr/share/texmf-modules-doc || mkdir -p /usr/share/tex/texmf-modules/doc
RUN mv /usr/share/tex/texmf-context/doc /usr/share/texmf-context-doc
RUN mkdir -p /usr/share/texmf-fonts && for dir in opentype truetype type1; do mv "/usr/share/tex/texmf/fonts/$dir/" /usr/share/texmf-fonts/; done
RUN rm -rf /usr/share/tex/texmf-cache/*

FROM minidocks/base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV CONTEXT_HOME=/usr/share \
    PATH=$PATH:/usr/share/tex/texmf-linuxmusl-64/bin \
    TEXMFCACHE=/usr/share/tex/texmf-cache \
    MTX_FONTS_AUTOLOAD=yes

COPY --from=dist /usr/share/tex /usr/share/tex
COPY --from=dist /usr/share/texmf-fonts/opentype/public/lm /usr/share/tex/texmf/fonts/opentype/public/lm

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
