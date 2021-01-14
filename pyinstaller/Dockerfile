ARG python_version=3
ARG pyinstaller_version=4.2

FROM minidocks/python:2-build AS b2

FROM minidocks/python:3-build AS b3

FROM b$python_version AS build

ARG python_version
ARG pyinstaller_version

RUN apk add zlib-dev \
    && wget -O /tmp/pyinstaller.tar.gz "https://github.com/pyinstaller/pyinstaller/archive/v${pyinstaller_version}.tar.gz" && tar -xzf /tmp/pyinstaller.tar.gz -C /tmp \
    && cd /tmp/pyinstaller*/bootloader && CFLAGS="-Wno-stringop-overflow" "python${python_version}" ./waf configure --no-lsb all \
    && "pip${python_version}" install --prefix="/tmp/pyinstaller" ..

FROM minidocks/python:2 AS v2

FROM minidocks/python:3 AS v3

FROM v$python_version AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG python_version

RUN apk add binutils "py${python_version}-crypto" && clean

COPY --from=build /tmp/pyinstaller/ /usr/
COPY rootfs /

CMD [ "pyinstaller" ]
