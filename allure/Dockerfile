ARG ALLURE_VERSION=2.16.1
FROM minidocks/java
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG ALLURE_VERSION

RUN wget -O /tmp/allure.tgz "https://github.com/allure-framework/allure2/releases/download/${ALLURE_VERSION}/allure-${ALLURE_VERSION}.tgz" \
    && tar -xzf /tmp/allure.tgz -C /tmp && mv /tmp/allure-* /usr/share/allure && clean

ENV PATH="$PATH:/usr/share/allure/bin"

COPY rootfs /

CMD [ "allure" ]
