FROM webuni/python:3.6
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
    && rm -rf /var/cache/apk/* && pyclean

COPY rootfs /

CMD [ "uwsgi", "--ini", "/etc/uwsgi/uwsgi.ini" ]
