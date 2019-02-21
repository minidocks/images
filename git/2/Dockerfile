FROM minidocks/base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV GIT_STANDUP_VERSION=2.3.0

RUN apk --update add git git-subtree git-lfs ncurses less bash \
    && wget -O /usr/libexec/git-core/git-hooks https://raw.githubusercontent.com/icefox/git-hooks/master/git-hooks \
    && wget -O /usr/libexec/git-core/git-standup https://raw.githubusercontent.com/kamranahmedse/git-standup/$GIT_STANDUP_VERSION/git-standup \
    && chmod a+x /usr/libexec/git-core/git-hooks /usr/libexec/git-core/git-standup \
    && clean

COPY rootfs /

CMD [ "git" ]

# https://github.com/jderusse/docker-gitsplit/blob/master/Dockerfile
