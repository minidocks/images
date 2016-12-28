FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add graphviz \
    && rm -rf /var/cache/apk/* /tmp/*

CMD [ "dot" ]
