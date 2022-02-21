FROM minidocks/perl AS minimal
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=2021
ARG TARGETARCH

RUN export bindir="$([ "$TARGETARCH" = "arm64" ] && echo "aarch64" || echo "x86_64")" \
    && mkdir -p /usr/local/texlive/bin && ln -s "/usr/local/texlive/bin/$bindir-linuxmusl" /usr/local/texlive/bin/linuxmusl

ENV PATH="$PATH:/usr/local/texlive/bin/linuxmusl"

COPY rootfs /

RUN apk add xz && wget -O /tmp/install-tl-unx.tar.gz "http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${version}/install-tl-unx.tar.gz" \
    && tar -xvzf /tmp/install-tl-unx.tar.gz -C /tmp \
    && if [ "$version" = 2021 ]; then repository="http://ftp.cvut.cz/tex-archive/systems/texlive/tlnet/"; else repository="http://ftp.math.utah.edu/pub/texlive/historic/systems/texlive/$version/tlnet-final"; fi \
    && /tmp/*/install-tl --repository="$repository" --profile=/etc/texlive.profile --scheme=minimal && clean

FROM minimal AS basic

RUN tlmgr install scheme-basic latexmk pdfpages pdflscape ms pdfjam pdfcrop pdfbook2 && clean

FROM minimal AS context

RUN apk add fontconfig freetype libgcc && tlmgr install scheme-context && clean

FROM basic AS small

RUN apk add fontconfig freetype libgcc && tlmgr install scheme-small adjustbox background bidi csquotes collectbox everypage footmisc footnotebackref framed fvextra ly1 mdframed mweights needspace pagecolor sourcecodepro sourcesanspro titling xurl zref && clean

FROM small AS gregorio

RUN tlmgr install ctablestack luamplib xstring preprint libertine gregoriotex && clean

FROM small AS medium

RUN tlmgr install scheme-medium && clean

FROM medium AS full

RUN tlmgr install scheme-full && clean

FROM basic
