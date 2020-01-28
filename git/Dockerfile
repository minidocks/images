ARG fame_version=1.10.1
ARG git_standup_version=2.3.1
ARG monorepo_tools_version=8.0.0

# https://github.com/jderusse/docker-gitsplit/blob/master/Dockerfile
FROM golang:alpine AS splitsh

RUN apk add --no-cache git make cmake g++ openssl-dev libssh2-dev

RUN go get -d github.com/libgit2/git2go
RUN cd $GOPATH/src/github.com/libgit2/git2go && git submodule update --init
RUN cd $GOPATH/src/github.com/libgit2/git2go && make install-static

RUN go get --tags static github.com/splitsh/lite
RUN go build --tags static -o splitsh-lite github.com/splitsh/lite

FROM minidocks/pyinstaller AS fame

ARG fame_version

# https://github.com/pyinstaller/pyinstaller/issues/2560
RUN wget -O /tmp/fame.tar.gz https://github.com/casperdcl/git-fame/archive/v$fame_version.tar.gz \
    && tar -xzf /tmp/fame.tar.gz -C /tmp && cd /tmp/git-fame* && echo "from gitfame._gitfame import main; main()" > ./git-fame.py \
    && pip install tqdm && pyinstaller -s --clean -F git-fame.py && mv ./dist /tmp

FROM minidocks/base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG git_standup_version
ARG monorepo_tools_version

COPY --from=splitsh /go/splitsh-lite /usr/local/bin/splitsh-lite

COPY --from=fame /tmp/dist/git-fame /usr/libexec/git-core/git-fame

RUN apk --update add git git-subtree git-lfs ncurses less bash file util-linux \
    && wget -O /usr/libexec/git-core/git-hooks https://raw.githubusercontent.com/icefox/git-hooks/master/git-hooks \
    && wget -O /usr/libexec/git-core/git-standup https://raw.githubusercontent.com/kamranahmedse/git-standup/$git_standup_version/git-standup \
    && wget -O /usr/libexec/git-core/git-quick-stats https://raw.githubusercontent.com/arzzen/git-quick-stats/master/git-quick-stats \
    && wget -O /usr/local/bin/tomono https://raw.githubusercontent.com/unravelin/tomono/master/tomono.sh \
    && wget -O /tmp/git-extras.tar.gz https://github.com/tj/git-extras/archive/master.tar.gz && tar -xzf /tmp/git-extras.tar.gz -C /tmp && mv /tmp/git-extras*/bin/* /usr/libexec/git-core/ \
    && chmod a+x /usr/libexec/git-core/git-* /usr/local/bin/tomono \
    && wget -O /tmp/mt.tar.gz https://github.com/shopsys/monorepo-tools/archive/v$monorepo_tools_version.tar.gz \
    && tar -xzf /tmp/mt.tar.gz -C /tmp && cp /tmp/monore*/*.sh /usr/local/bin \
    && clean

COPY rootfs /

CMD [ "git" ]
