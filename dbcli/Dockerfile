ARG mycli_version=1.21.1
ARG pgcli_version=3.0.0
ARG litecli_version=1.3.2

FROM minidocks/python AS mycli
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG mycli_version

RUN apk --update add py3-cryptography && pip install mycli==$mycli_version && clean

COPY rootfs /

CMD [ "mycli" ]

FROM minidocks/python AS pgcli

ARG pgcli_version

RUN apk --update add py3-psycopg2 py3-setproctitle && pip install pgcli==$pgcli_version && clean

COPY rootfs /

CMD [ "pgcli" ]

FROM minidocks/python AS litecli

ARG litecli_version

RUN pip install litecli==$litecli_version && clean

COPY rootfs /

CMD [ "litecli" ]

FROM minidocks/python AS latest

ARG mycli_version
ARG pgcli_version
ARG litecli_version

RUN apk --update add py3-cryptography py3-psycopg2 py3-setproctitle && pip install pgcli==$pgcli_version mycli==$mycli_version litecli==$litecli_version && clean

COPY rootfs /
