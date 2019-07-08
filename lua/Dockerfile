ARG version=5.3
ARG base=latest

FROM minidocks/base AS latest

FROM minidocks/base:build AS build

FROM $base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version
ARG base

RUN apk --update add lua lua$version luarocks luarocks$version zip && clean

RUN ln -s /usr/bin/lua$version /usr/bin/lua; \
    ln -s /usr/bin/luac$version /usr/bin/luac; \
    ln -s /usr/bin/luarocks-$version /usr/bin/luarocks; \
    ln -s /usr/bin/luarocks-admin-$version /usr/bin/luarocks-admin;

RUN if [ "$base" = "build" ]; then \
        apk add "lua${version}-dev" \
        && clean; \
     fi

CMD [ "lua" ]
