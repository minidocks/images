ARG version=3.10
ARG suffix=""

FROM minidocks/base:3.15 AS base_2.7

FROM minidocks/base:3.15-build AS base_2.7-build

FROM minidocks/base:3.13 AS base_3.8

FROM minidocks/base:3.13-build AS base_3.8-build

FROM minidocks/base:3.15 AS base_3.9

FROM minidocks/base:3.15-build AS base_3.9-build

FROM minidocks/base:3.16 AS base_3.10

FROM minidocks/base:3.16-build AS base_3.10-build

FROM base_$version$suffix AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version

ENV PIP_NO_COMPILE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_CACHE_DIR=/pip-cache \
    PIPENV_VENV_IN_PROJECT=1 \
    CLEAN="$CLEAN:\$PIP_CACHE_DIR/:pyclean"

COPY rootfs /

# make some useful symlinks that are expected to exist
RUN if [ "${version::1}" = 3 ]; then \
        ln -s /usr/bin/python3 /usr/bin/python; \
        ln -s /usr/bin/pip3 /usr/bin/pip; \
        ln -s /usr/bin/easy_install-$version /usr/bin/easy_install; \
        ln -s /usr/bin/pydoc3 /usr/bin/pydoc; \
        ln -s /usr/bin/python3-config /usr/bin/python-config; \
    fi

RUN mkdir "$PIP_CACHE_DIR" && chmod a+rwx "$PIP_CACHE_DIR" \
    && apk add "python${version::1}" && "python${version::1}" -m ensurepip --upgrade \
    && pip install -U pip setuptools wheel \
    && clean

RUN if [ "${version::1}" = 2 ]; then pip install micropipenv==1.2.0; else pip install micropipenv; fi && clean

CMD [ "python" ]

FROM latest AS packaging

ARG version

RUN if [ "${version::1}" = 3 ]; then \
        apk add py3-cryptography && pip install poetry flit; \
    fi && pip install virtualenv pipenv twine && clean

FROM packaging AS build

ARG version

RUN apk -U add "python${version::1}-dev" libffi-dev openssl-dev && clean

FROM latest AS uwsgi
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update --no-cache add nginx \
        uwsgi \
        uwsgi-alarm_curl \
        uwsgi-cache \
        uwsgi-carbon \
        uwsgi-cgi \
        uwsgi-cheaper_backlog2 \
        uwsgi-cheaper_busyness \
        uwsgi-corerouter \
        uwsgi-curl_cron \
        uwsgi-dumbloop \
        uwsgi-dummy \
        uwsgi-echo \
        uwsgi-emperor_amqp \
        uwsgi-emperor_pg \
        uwsgi-emperor_zeromq \
        uwsgi-fastrouter \
        uwsgi-forkptyrouter \
        uwsgi-geoip \
        uwsgi-gevent \
        uwsgi-gevent3 \
        uwsgi-graylog2 \
        uwsgi-http \
        uwsgi-legion_cache_fetch \
        uwsgi-logcrypto \
        uwsgi-logfile \
        uwsgi-logpipe \
        uwsgi-logsocket \
        uwsgi-logzmq \
        uwsgi-lua \
        uwsgi-msgpack \
        uwsgi-nagios \
        uwsgi-notfound \
        uwsgi-pam \
        uwsgi-ping \
        uwsgi-pty \
        uwsgi-python3 \
        uwsgi-rawrouter \
        uwsgi-redislog \
        uwsgi-router_basicauth \
        uwsgi-router_cache \
        uwsgi-router_expires \
        uwsgi-router_hash \
        uwsgi-router_http \
        uwsgi-router_memcached \
        uwsgi-router_metrics \
        uwsgi-router_radius \
        uwsgi-router_redirect \
        uwsgi-router_redis \
        uwsgi-router_rewrite \
        uwsgi-router_static \
        uwsgi-router_uwsgi \
        uwsgi-rpc \
        uwsgi-rrdtool \
        uwsgi-rsyslog \
        uwsgi-signal \
        uwsgi-spooler \
        uwsgi-sslrouter \
        uwsgi-stats_pusher_file \
        uwsgi-stats_pusher_socket \
        uwsgi-stats_pusher_statsd \
        uwsgi-symcall \
        uwsgi-syslog \
        uwsgi-transformation_chunked \
        uwsgi-transformation_gzip \
        uwsgi-transformation_offload \
        uwsgi-transformation_template \
        uwsgi-transformation_tofile \
        uwsgi-tuntap \
        uwsgi-ugreen \
        uwsgi-webdav \
        uwsgi-xslt \
        uwsgi-zabbix \
        uwsgi-zergpool \
    && clean

COPY rootfs-uwsgi /

CMD [ "uwsgi", "--ini", "/etc/uwsgi/uwsgi.ini" ]

FROM latest
