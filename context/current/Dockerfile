FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update --no-cache add rsync \
    && cd /usr/share && wget http://minimals.contextgarden.net/setup/first-setup.sh \
    && sh ./first-setup.sh --modules=all --engine=luatex --context=current \
    && /usr/share/tex/setuptex && apk del rsync \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/tex/texmf-context/doc /usr/share/tex/texmf-modules/doc

ENV CONTEXT_HOME=/usr/share \
    PATH=$PATH:/usr/share/tex/texmf-linuxmusl-64/bin \
    TEXMFCACHE=/usr/share/tex/texmf-cache

COPY rootfs /

CMD [ "context" ]
