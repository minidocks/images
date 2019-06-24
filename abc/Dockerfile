FROM minidocks/base:build AS abcm2ps

RUN apk add pango-dev

ARG abc2prt_version=1.0.2

RUN wget -O /tmp/abc2prt.tar.gz "https://sourceforge.net/projects/abcplus/files/abc2prt/abc2prt-${abc2prt_version}.tar.gz" \
    && tar -xvzf /tmp/abc2prt.tar.gz -C /tmp && cd /tmp/abc2prt* \
    && mkdir -p /tmp/build && make && mv abc2prt /tmp/build

ARG abcpp_version=1.4.5

RUN wget -O /tmp/abcpp.tar.gz "https://sourceforge.net/projects/abcplus/files/abcpp/abcpp-${abcpp_version}.tar.gz" \
    && tar -xvzf /tmp/abcpp.tar.gz -C /tmp && cd /tmp/abcpp* \
    && mkdir -p /tmp/build && make && mv abcpp /tmp/build

ARG abcm2ps_version=8.14.4

RUN wget -O /tmp/abcm2ps.tar.gz "https://github.com/leesavide/abcm2ps/archive/v${abcm2ps_version}.tar.gz" \
    && tar -xvzf /tmp/abcm2ps.tar.gz -C /tmp && cd /tmp/abcm2ps* \
    && mkdir -p /tmp/build && ./configure && make DESTDIR=/tmp/build install

ARG abc2midi_version=2019.06.20

RUN wget -O /tmp/abc2midi.zip "https://ifdo.ca/~seymour/runabc/abcMIDI-${abc2midi_version}.zip" \
    && unzip /tmp/abc2midi.zip -d /tmp && cd /tmp/abcmidi* \
    && mkdir -p /tmp/build && ./configure && make DESTDIR=/tmp/build install

FROM minidocks/pyinstaller AS abc2xml

ARG xml2abc_version=139
ARG abc2xml_version=220

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
