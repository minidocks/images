FROM webuni/base:3.8
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add git git-subtree bash \
    && wget -O /usr/libexec/git-core/git-hooks https://raw.githubusercontent.com/icefox/git-hooks/master/git-hooks \
    && chmod a+x /usr/libexec/git-core/git-hooks \
    && rm -rf /var/cache/apk/* /tmp/*

COPY rootfs /

CMD [ "git" ]
