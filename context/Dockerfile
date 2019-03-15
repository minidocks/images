ARG version=beta

FROM minidocks/base

ARG version

RUN apk --update --no-cache add rsync
RUN cd /usr/share && wget http://minimals.contextgarden.net/setup/first-setup.sh
RUN cd /usr/share && sh ./first-setup.sh --modules=all --engine=luatex --context="$version"
RUN mv /usr/share/tex/texmf-modules/doc /usr/share/texmf-modules-doc
RUN mv /usr/share/tex/texmf-context/doc /usr/share/texmf-context-doc
RUN mkdir -p /usr/share/texmf-fonts && for dir in truetype type1 opentype; do mv "/usr/share/tex/texmf/fonts/$dir" /usr/share/texmf-fonts; done
RUN rm -rf /usr/share/tex/texmf-cache/* && chmod 777 /usr/share/tex/texmf-cache

FROM minidocks/base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV CONTEXT_HOME=/usr/share \
    PATH=$PATH:/usr/share/tex/texmf-linuxmusl-64/bin \
    TEXMFCACHE=/usr/share/tex/texmf-cache

COPY --from=0 /usr/share/tex /usr/share/tex

RUN mtxrun --generate

COPY rootfs /

CMD [ "context" ]

FROM beta AS fonts

COPY --from=0 /usr/share/texmf-fonts/* /usr/share/tex/texmf/fonts/*

FROM beta AS docs

COPY --from=0 /usr/share/texmf-context-doc /usr/share/tex/texmf-context/doc
COPY --from=0 /usr/share/texmf-modules-doc /usr/share/tex/texmf-modules/doc

FROM latest
