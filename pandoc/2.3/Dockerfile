FROM webuni/base:3.8-build

RUN apk -U add ghc cabal wget zlib-dev

ENV PANDOC_VERSION=2.3.1

RUN watch -n 300 'echo tick' &
RUN cabal update && cabal install "pandoc-${PANDOC_VERSION}" -fembed_data_files

FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add gmp libffi && clean

ENV PANDOC_VERSION=2.3.1

COPY --from=0 /root/.cabal/bin/pandoc /usr/local/bin/pandoc
COPY rootfs /

CMD [ "pandoc" ]
