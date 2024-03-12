ARG fame_version=2.0.1
ARG filter_version=2.38.0
ARG git_standup_version=2.3.2
ARG monorepo_tools_version=13.0.0
ARG git_extras_version=7.1.0
ARG git_quick_stats_version=2.5.4

# https://github.com/splitsh/lite/pull/75/files
FROM golang:1.22-alpine AS splitsh

WORKDIR /build

RUN apk add build-base make cmake automake autoconf libtool python3 git g++ openssl-dev libssh2-dev libgit2-dev

RUN git clone https://github.com/splitsh/lite .

RUN go mod download
RUN git clone https://github.com/libgit2/git2go vendor/github.com/libgit2/git2go/v34
RUN cd vendor/github.com/libgit2/git2go/v34 && git checkout v34.0.0 && git submodule update --init && make install-static
RUN mv vendor/github.com/libgit2/git2go/v34 git2go

RUN go mod vendor
RUN rm -rf vendor/github.com/libgit2/git2go/v34
RUN mv git2go vendor/github.com/libgit2/git2go/v34

# Build
RUN go build -tags static -ldflags="-s -w -X 'main.version=$(git describe --tags)'" -o splitsh-lite ./main.go

WORKDIR /dist
RUN cp /build/splitsh-lite ./splitsh-lite
RUN ldd splitsh-lite | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'mkdir -p $(dirname ./%); cp % ./%;'

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

COPY --from=splitsh /dist/ /usr/local/bin/
COPY --from=python /tmp/dist/git-fame /usr/libexec/git-core/git-fame
COPY --from=python /tmp/dist/git-filter-repo /usr/libexec/git-core/git-filter-repo

RUN if [ "$(arch)" == "x86_64" ]; then metafile="git-metafile"; fi \
    && apk --update add git git-crypt git-subtree git-lfs git-fast-import git-secret@edge git-sizer $metafile git-interactive-rebase-tool ncurses less bash file util-linux http-parser libssh2 \
    && wget -O /usr/libexec/git-core/git-standup https://raw.githubusercontent.com/kamranahmedse/git-standup/$git_standup_version/git-standup \
    && wget -O /usr/libexec/git-core/git-quick-stats https://raw.githubusercontent.com/arzzen/git-quick-stats/$git_quick_stats_version/git-quick-stats \
    && wget -O /usr/libexec/git-core/git-hooks https://raw.githubusercontent.com/EndorphinBrowser/git-hooks/master/git-hooks \
    && wget -O /usr/libexec/git-core/git-secrets https://raw.githubusercontent.com/awslabs/git-secrets/master/git-secrets \
    && wget -O /usr/local/bin/tomono https://raw.githubusercontent.com/hraban/tomono/master/tomono \
    && wget -O /tmp/git-extras.tar.gz https://github.com/tj/git-extras/archive/$git_extras_version.tar.gz && tar -xzf /tmp/git-extras.tar.gz -C /tmp && mv /tmp/git-extras*/bin/* /usr/libexec/git-core/ \
    && chmod a+x /usr/libexec/git-core/git-* /usr/local/bin/tomono \
    && wget -O /tmp/mt.tar.gz https://github.com/shopsys/monorepo-tools/archive/v$monorepo_tools_version.tar.gz \
    && tar -xzf /tmp/mt.tar.gz -C /tmp && cp /tmp/monore*/*.sh /usr/local/bin \
    && clean

COPY rootfs /

CMD [ "git" ]
