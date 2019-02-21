FROM minidocks/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add graphviz \
    && rm -rf /var/cache/apk/* /tmp/*

CMD [ "dot" ]
