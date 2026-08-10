ARG version=^4

FROM minidocks/node
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

ENV TAILWIND_HOME=/usr/local/lib/tailwindcss

# npm is unable to install into "/", so the packages live in $TAILWIND_HOME and
# are linked into $NODE_PATH, where `@import "tailwindcss"` and `@plugin` are
# resolved from any working directory
RUN mkdir -p "$TAILWIND_HOME" && cd "$TAILWIND_HOME" && echo '{"private":true}' > package.json \
    && npm install --no-package-lock "@tailwindcss/cli@${version}" @tailwindcss/typography @tailwindcss/forms \
    && ln -s "$TAILWIND_HOME/node_modules/.bin/tailwindcss" /usr/local/bin/tailwindcss \
    && ln -s "$TAILWIND_HOME"/node_modules/* /node_modules/ \
    && clean

COPY rootfs /

CMD [ "tailwindcss" ]
