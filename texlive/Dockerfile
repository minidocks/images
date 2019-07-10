FROM minidocks/perl AS minimal
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=2019

ENV PATH="$PATH:/usr/local/texlive/bin/x86_64-linuxmusl"

COPY rootfs /

RUN apk add xz && wget -O /tmp/install-tl-unx.tar.gz "http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/${version}/install-tl-unx.tar.gz" \
    && tar -xvzf /tmp/install-tl-unx.tar.gz -C /tmp \
    && if [ "$version" = 2019 ]; then repository="http://ftp.math.utah.edu/pub/texlive/tlnet"; else repository="http://ftp.math.utah.edu/pub/tex/historic/systems/texlive/$version/tlnet-final"; fi \
    && /tmp/*/install-tl --repository="$repository" --profile=/etc/texlive.profile --scheme=minimal && clean

FROM minimal AS basic

RUN tlmgr install scheme-basic pdfpages ms pdfjam pdfcrop pdfbook2 && clean

FROM minimal AS context

RUN apk add fontconfig freetype libgcc && tlmgr install scheme-context && clean

FROM basic AS small

RUN apk add fontconfig freetype libgcc && tlmgr install scheme-small pagecolor csquotes xurl adjustbox bidi mdframed sourcecodepro sourcesanspro titling needspace ly1 mweights && clean

FROM small AS medium

RUN tlmgr install scheme-medium && clean

FROM medium AS full

RUN tlmgr install scheme-full && clean

FROM basic
