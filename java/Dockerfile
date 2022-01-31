FROM minidocks/base AS headless
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG TARGETARCH
ARG version

RUN if echo "8" | grep -q "$version"; then headless='base'; else headless='headless'; fi \
    && apk --update add "openjdk${version}-jre-${headless}" \
    && if [ "17" = "$version" && "$TARGETARCH" != "arm64" ]; then apk add java-jna-native; fi \
    && clean

FROM headless AS gui
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

RUN apk --update add "openjdk${version}-jre" && clean

FROM gui AS gradle
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add gradle && clean

FROM headless AS latest
