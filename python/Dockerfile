ARG version=3.7

FROM minidocks/base:3.5 AS base_3.5

FROM minidocks/base:3.9 AS base_3.6

FROM minidocks/base:3.10 AS base_2.7

FROM minidocks/base:3.10 AS base_3.7

FROM base_$version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ENV PIP_NO_COMPILE=1 \
    PIP_CACHE_DIR=/pip-cache \
    CLEAN="$CLEAN:\$PIP_CACHE_DIR/:pyclean"

COPY rootfs /

ARG version

RUN if [ "${version%%.*}" = 2 ]; then apk -U add python2 py2-pip; else apk -U add python3; fi && clean

# make some useful symlinks that are expected to exist
RUN if [ "${version%%.*}" = 3 ]; then \
        ln -s /usr/bin/python3 /usr/bin/python; \
        ln -s /usr/bin/pip3 /usr/bin/pip; \
        ln -s /usr/bin/easy_install-$version /usr/bin/easy_install; \
        ln -s /usr/bin/idle3 /usr/bin/idle; \
        ln -s /usr/bin/pydoc3 /usr/bin/pydoc; \
    fi

RUN mkdir "$PIP_CACHE_DIR" && chmod a+rwx "$PIP_CACHE_DIR" \
    && pip install -U pip pipenv wheel && if [ "${version%%.*}" = 3 ]; then pip install flit; fi \
    && clean

CMD [ "python" ]

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
