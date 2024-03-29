FROM minidocks/base:build AS abcm2ps

RUN apk add -u pango-dev

ARG abc2prt_version=1.0.2

RUN wget -O /tmp/abc2prt.tar.gz "https://sourceforge.net/projects/abcplus/files/abc2prt/abc2prt-${abc2prt_version}.tar.gz" \
    && tar -xvzf /tmp/abc2prt.tar.gz -C /tmp && cd /tmp/abc2prt* \
    && mkdir -p /tmp/build && make && mv abc2prt /tmp/build

ARG abcpp_version=1.4.6

RUN wget -O /tmp/abcpp.tar.gz "https://sourceforge.net/projects/abcplus/files/abcpp/abcpp-${abcpp_version}.tar.gz" \
    && tar -xvzf /tmp/abcpp.tar.gz -C /tmp && cd /tmp/abcpp* \
    && mkdir -p /tmp/build && make && mv abcpp /tmp/build

ARG abcm2ps_version=8.14.15

RUN wget -O /tmp/abcm2ps.tar.gz "https://github.com/leesavide/abcm2ps/archive/v${abcm2ps_version}.tar.gz" \
    && tar -xvzf /tmp/abcm2ps.tar.gz -C /tmp && cd /tmp/abcm2ps* \
    && mkdir -p /tmp/build && ./configure && make DESTDIR=/tmp/build install

RUN wget -O /tmp/abc2midi.zip "https://github.com/sshlien/abcmidi/archive/refs/heads/master.zip" \
    && unzip /tmp/abc2midi.zip -d /tmp && cd /tmp/abcmidi* \
    && mkdir -p /tmp/build && ./configure && make DESTDIR=/tmp/build install

FROM minidocks/pyinstaller AS abc2xml

RUN apk add pup

RUN url="https://wim.vree.org/svgParse" \
    && wget -O /tmp/xml2abc.zip "$url/$(wget -qO - "$url/xml2abc.html" | pup 'a[href*=zip] attr{href}' | head -1)" \
    && wget -O /tmp/abc2xml.zip "$url/$(wget -qO - "$url/abc2xml.html" | pup 'a[href*=zip] attr{href}' | head -1)"

RUN unzip /tmp/xml2abc.zip -d /tmp && unzip /tmp/abc2xml.zip -d /tmp

RUN pyinstaller -s /tmp/xml2abc*/xml2abc.py && pyinstaller -s /tmp/abc2xml*/abc2xml.py

RUN mkdir /tmp/final && cp -r /dist/xml2abc/* /tmp/final && cp -r /dist/abc2xml/* /tmp/final \
    && rm /tmp/final/_internal/libcrypto*so*

FROM minidocks/node:lts-base AS latest
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

COPY --from=abcm2ps /tmp/build /
COPY --from=abc2xml /tmp/final/ /usr/local/bin/

RUN apk add -u pango npm && npm i -g abc2svg jszip && apk del npm && clean

COPY rootfs /

CMD [ "abc2svg" ]
