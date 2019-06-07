ARG base_version=3.9

FROM minidocks/base:3.6 AS v3.6

FROM minidocks/base:3.8 AS v3.8

FROM minidocks/base:3.9 AS v3.9

FROM v$base_version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add erlang && clean

CMD [ "erl" ]
