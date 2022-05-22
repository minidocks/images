FROM minidocks/ruby
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add ruby-json ruby-bigdecimal libstdc++ sqlite-libs \
    && apk add --virtual build-dependencies build-base ruby-dev sqlite-dev \
    && gem install mailcatcher --no-document \
    && apk del build-dependencies && rm -rf /var/cache/apk/* /tmp/* /root/.gem

EXPOSE 25 80

COPY rootfs /

CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
