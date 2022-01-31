ARG version=3.0

FROM minidocks/base:3.14 AS v2.7

FROM minidocks/base:3.15 AS v3.0

FROM v${version}
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

# install things globally, for great justice and don't create ".bundle" in all our apps
ENV GEM_HOME=/usr/local/bundle \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG=/usr/local/bundle \
    BUNDLE_CACHE_PATH=/gem-cache

# path recommendation: https://github.com/bundler/bundler/pull/6469#issuecomment-383235438
ENV PATH=$GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH
# adjust permissions of a few directories for running "gem install" as an arbitrary user
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME" && mkdir -p "$BUNDLE_CACHE_PATH" && chmod 777 "$BUNDLE_CACHE_PATH"

COPY rootfs /

RUN apk add ruby ruby-irb && gem install bundler && clean

CMD [ "irb" ]
