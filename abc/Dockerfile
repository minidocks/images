ARG abcm2ps_version=8.14.4
ARG xml2abc_version=135
ARG abc2xml_version=218

FROM minidocks/base:3.9-build AS abcm2ps

ARG abcm2ps_version

RUN apk add pango-dev

RUN wget -O /tmp/abcm2ps.tar.gz "https://github.com/leesavide/abcm2ps/archive/v${abcm2ps_version}.tar.gz" \
    && tar -xvzf /tmp/abcm2ps.tar.gz -C /tmp && cd /tmp/abc* \
    && mkdir /tmp/build && ./configure && make DESTDIR=/tmp/build install

FROM minidocks/pyinstaller AS abc2xml

ARG xml2abc_version
ARG abc2xml_version

RUN apk add wget && wget -O /tmp/xml2abc.zip "https://wim.vree.org/svgParse/xml2abc.py-${xml2abc_version}.zip" \
    && wget -O /tmp/abc2xml.zip "https://wim.vree.org/svgParse/abc2xml.py-${abc2xml_version}.zip" \
    && unzip /tmp/xml2abc.zip -d /tmp && unzip /tmp/abc2xml.zip -d /tmp \
    && pyinstaller -s /tmp/xml2abc*/xml2abc.py && pyinstaller -s /tmp/abc2xml*/abc2xml.py

RUN mkdir /tmp/final && cp -r /dist/xml2abc/* /tmp/final && cp -r /dist/abc2xml/* /tmp/final \
    && rm /tmp/final/libcrypto*so*

FROM minidocks/node AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

COPY --from=abcm2ps /tmp/build /
COPY --from=abc2xml /tmp/final/* /usr/local/bin/

RUN apk add pango && npm i -g abc2svg jszip && clean

CMD [ "abcm2ps" ]
