FROM minidocks/python AS mycli
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk --update add py3-cryptography && pip install mycli && clean

COPY rootfs /

CMD [ "mycli" ]

FROM minidocks/python AS pgcli

RUN apk --update add py3-psutil py3-psycopg2 py3-setproctitle && pip install pg_activity pgcli && clean

COPY rootfs /

CMD [ "pgcli" ]

FROM minidocks/python AS litecli

RUN pip install litecli && clean

COPY rootfs /

CMD [ "litecli" ]

FROM minidocks/python AS iredis

RUN pip install iredis && clean

COPY rootfs /

CMD [ "iredis" ]

FROM minidocks/python AS latest


RUN apk --update add py3-cryptography py3-psutil py3-psycopg2 py3-setproctitle \
    && pip install pg_activity pgcli mycli litecli iredis && clean

COPY rootfs /
