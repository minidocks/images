FROM minidocks/librsvg
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN apk add libreoffice && clean

RUN apk add msttcorefonts-installer font-freefont font-noto font-opensans font-roboto font-carlito font-overpass font-dejavu && clean
RUN wget -P /usr/share/fonts http://quivira-font.com/files/Quivira.otf
RUN wget -P /usr/share/fonts https://catrinity-font.de/downloads/Catrinity.otf

RUN update-ms-fonts && fc-cache -f && clean

COPY rootfs /

CMD [ "libreoffice" ]
