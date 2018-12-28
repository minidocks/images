FROM webuni/base:3.8-build AS cache

RUN apk -U add ghc cabal wget zlib-dev

RUN echo "while true; do echo tick > /proc/1/fd/1; sleep 60; done &" > tick.sh && sh tick.sh \
    && cabal update && cabal install "pandoc" -fembed_data_files

FROM cache AS build

ENV PANDOC_VERSION=2.5

RUN sh tick.sh && cabal install "pandoc-${PANDOC_VERSION}" -fembed_data_files

FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add gmp libffi && clean

ENV PANDOC_VERSION=2.5

COPY --from=build /root/.cabal/bin/pandoc /usr/local/bin/pandoc
COPY rootfs /

CMD [ "pandoc" ]
