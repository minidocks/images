# https://github.com/jderusse/docker-gitsplit/blob/master/Dockerfile
FROM golang:alpine AS splitsh

RUN apk add --no-cache git make cmake g++ openssl-dev libssh2-dev

RUN go get -d github.com/libgit2/git2go
RUN cd $GOPATH/src/github.com/libgit2/git2go && git submodule update --init
RUN cd $GOPATH/src/github.com/libgit2/git2go && make install-static

RUN go get --tags static github.com/splitsh/lite
RUN go build --tags static -o splitsh-lite github.com/splitsh/lite

FROM minidocks/base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV GIT_STANDUP_VERSION=2.3.1 \
    MONOREPO_TOOLS_VERSION=8.0.0

COPY --from=splitsh /go/splitsh-lite /usr/local/bin/splitsh-lite

RUN apk --update add git git-subtree git-lfs ncurses less bash \
    && wget -O /usr/libexec/git-core/git-hooks https://raw.githubusercontent.com/icefox/git-hooks/master/git-hooks \
    && wget -O /usr/libexec/git-core/git-standup https://raw.githubusercontent.com/kamranahmedse/git-standup/$GIT_STANDUP_VERSION/git-standup \
    && wget -O /usr/local/bin/tomono https://raw.githubusercontent.com/unravelin/tomono/master/tomono.sh \
    && chmod a+x /usr/libexec/git-core/git-hooks /usr/libexec/git-core/git-standup /usr/local/bin/tomono \
    && wget -O /tmp/mt.tar.gz https://github.com/shopsys/monorepo-tools/archive/v$MONOREPO_TOOLS_VERSION.tar.gz \
    && tar -xzf /tmp/mt.tar.gz -C /tmp && cp /tmp/monore*/*.sh /usr/local/bin \
    && clean

COPY rootfs /

CMD [ "git" ]
