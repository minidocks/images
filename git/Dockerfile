ARG fame_version=1.15.0
ARG filter_version=2.33.0
ARG git_standup_version=2.3.2
ARG monorepo_tools_version=9.1.2
ARG git_extras_version=6.2.0
ARG git_quick_stats_version=2.3.0
ARG meta_version=2.2.25

# https://github.com/jderusse/docker-gitsplit/blob/master/Dockerfile
#FROM golang:alpine AS splitsh
#
#RUN apk add --no-cache git make cmake g++ openssl-dev libssh2-dev libgit2-dev
#
#RUN go get -d github.com/libgit2/git2go
#RUN cd $GOPATH/src/github.com/libgit2/git2go && git checkout v28.4.0 && git submodule update --init
#RUN cd $GOPATH/src/github.com/libgit2/git2go && make install-static
#
#RUN go get --tags static github.com/splitsh/lite
#RUN go build --tags static -o splitsh-lite github.com/splitsh/lite

FROM minidocks/pyinstaller AS python

ARG fame_version
ARG filter_version

# https://github.com/pyinstaller/pyinstaller/issues/2560
RUN wget -O /tmp/fame.tar.gz https://github.com/casperdcl/git-fame/archive/v$fame_version.tar.gz \
    && tar -xzf /tmp/fame.tar.gz -C /tmp && cd /tmp/git-fame* && echo "from gitfame._gitfame import main; main()" > ./git-fame.py \
    && echo "Version: $fame_version" > PKG-INFO \
    && pip install tqdm && pyinstaller -s --clean -F git-fame.py && mv ./dist /tmp

RUN cd /tmp \
    && wget https://raw.githubusercontent.com/newren/git-filter-repo/v$filter_version/git-filter-repo \
    && wget https://raw.githubusercontent.com/newren/git-filter-repo/v$filter_version/contrib/filter-repo-demos/bfg-ish \
    && pyinstaller -s --clean -F git-filter-repo && pyinstaller -s --clean -F bfg-ish

FROM minidocks/base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG git_standup_version
ARG monorepo_tools_version
ARG git_extras_version
ARG git_quick_stats_version

#COPY --from=splitsh /go/splitsh-lite /usr/local/bin/splitsh-lite
COPY --from=python /tmp/dist/git-fame /usr/libexec/git-core/git-fame
COPY --from=python /tmp/dist/git-filter-repo /usr/libexec/git-core/git-filter-repo

# Reposity icefox/git-hooks does not exist :(
# && wget -O /usr/libexec/git-core/git-hooks https://raw.githubusercontent.com/icefox/git-hooks/master/git-hooks \

RUN if [ "$(arch)" == "x86_64" ]; then metafile="git-metafile"; fi \
    && apk --update add git git-crypt git-subtree git-lfs git-fast-import git-secret@edge git-sizer@edge $metafile git-interactive-rebase-tool ncurses less bash file util-linux http-parser libssh2 \
    && wget -O /usr/libexec/git-core/git-standup https://raw.githubusercontent.com/kamranahmedse/git-standup/$git_standup_version/git-standup \
    && wget -O /usr/libexec/git-core/git-quick-stats https://raw.githubusercontent.com/arzzen/git-quick-stats/$git_quick_stats_version/git-quick-stats \
    && wget -O /usr/local/bin/tomono https://raw.githubusercontent.com/CyberGRX/tomono/master/tomono.sh \
    && wget -O /tmp/git-extras.tar.gz https://github.com/tj/git-extras/archive/$git_extras_version.tar.gz && tar -xzf /tmp/git-extras.tar.gz -C /tmp && mv /tmp/git-extras*/bin/* /usr/libexec/git-core/ \
    && chmod a+x /usr/libexec/git-core/git-* /usr/local/bin/tomono \
    && wget -O /tmp/mt.tar.gz https://github.com/shopsys/monorepo-tools/archive/v$monorepo_tools_version.tar.gz \
    && tar -xzf /tmp/mt.tar.gz -C /tmp && cp /tmp/monore*/*.sh /usr/local/bin \
    && clean

COPY rootfs /

CMD [ "git" ]
