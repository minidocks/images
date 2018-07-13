FROM webuni/python:3.6
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update --no-cache add uwsgi-python3 \
    && rm -rf /var/cache/apk/* && pyclean
