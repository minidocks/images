ARG erlang_version=23

FROM minidocks/base:3.11 AS v22

FROM minidocks/base:3.13 AS v23

FROM v$erlang_version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add erlang && clean

CMD [ "erl" ]
