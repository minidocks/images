FROM minidocks/base AS headless
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add java-jna-native openjdk8-jre-base && clean

FROM headless AS gui
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add openjdk8-jre && clean

FROM headless AS latest
