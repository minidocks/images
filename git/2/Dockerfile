FROM webuni/base:3.5
MAINTAINER Martin Hasoň "martin.hason@gmail.com"

RUN apk --update add git git-subtree bash \
    && wget -O /usr/libexec/git-core/git-subsplit https://raw.githubusercontent.com/dflydev/git-subsplit/master/git-subsplit.sh \
    && chmod a+x /usr/libexec/git-core/git-subsplit \
    && rm -rf /var/cache/apk/* /tmp/*
