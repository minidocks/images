ARG erlang_version=22

FROM minidocks/base:3.6 AS v19

FROM minidocks/base:3.8 AS v20

FROM minidocks/base:3.9 AS v21

FROM minidocks/base:3.10 AS v22

FROM v$erlang_version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add erlang && clean

CMD [ "erl" ]
