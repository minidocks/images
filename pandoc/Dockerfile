FROM minidocks/lua
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG version=3.6

ENV XDG_DATA_HOME=/ \
    LUA_PATH="/pandoc/filters/?.lua;;"

RUN wget -O /tmp/pandoc.tar.gz "https://github.com/jgm/pandoc/releases/download/${version}/pandoc-${version}-linux-amd64.tar.gz" \
    && tar -xvzf /tmp/pandoc.tar.gz -C /tmp && mv /tmp/pandoc*/bin/pandoc /usr/local/bin/pandoc && clean

RUN mkdir -p /pandoc/templates \
    && wget -O /pandoc/templates/eisvogel.latex https://raw.githubusercontent.com/Wandmalfarbe/pandoc-latex-template/2.4.2/eisvogel.tex \
    && wget -O /pandoc/templates/template-letter.tex https://raw.githubusercontent.com/aaronwolen/pandoc-letter/master/template-letter.tex \
    && wget -O /pandoc/templates/chmduquesne.tex https://raw.githubusercontent.com/mszep/pandoc_resume/master/styles/chmduquesne.tex \
    && wget -O /pandoc/templates/chmduquesne.css https://raw.githubusercontent.com/mszep/pandoc_resume/master/styles/chmduquesne.css \
    && wget -O /pandoc/templates/leaflet.latex https://gitlab.com/daamien/pandoc-leaflet-template/-/raw/1.0/leaflet.latex \
    && chown -R user:users /pandoc \
    && clean

RUN apk add lua-penlight && clean

RUN mkdir -p /pandoc/filters \
    && wget -O /tmp/pandoc-filters.zip https://github.com/teoric/pandoc-filters/archive/master.zip && unzip /tmp/pandoc-filters.zip -d /tmp && cd /tmp/pandoc-filters* && find . -name '*.lua' | cpio -pdm /pandoc/filters && clean \
    && wget -O /tmp/filters.zip https://github.com/pandoc/lua-filters/archive/master.zip && unzip /tmp/filters.zip -d /tmp && cp -r /tmp/lua-filters*/**/*.lua /pandoc/filters && clean\
    && wget -O /pandoc/filters/select-meta.lua https://github.com/jgm/select-meta/blob/master/select-meta.lua && clean \
    && wget -O /pandoc/filters/table.lua https://raw.githubusercontent.com/PlushBeaver/pandoc-table-filter/master/table.lua && clean \
    && wget -O /tmp/panpipe.zip https://github.com/mitinarseny/panpipe/archive/master.zip && unzip /tmp/panpipe.zip -d /tmp && cp -r /tmp/panpipe*/*.lua /pandoc/filters && clean \
    && wget -O /pandoc/filters/gls.lua https://raw.githubusercontent.com/tomncooper/pandoc-gls/master/pandoc-gls.lua && clean \
    && wget -O /tmp/pandoc-filters.zip https://github.com/a-vrma/pandoc-filters/archive/master.zip && unzip /tmp/pandoc-filters.zip -d /tmp && cp -r /tmp/pandoc-filters*/dist/*.lua /pandoc/filters && clean \
    && wget -O /tmp/pandocker-lua-filters.zip https://github.com/pandocker/pandocker-lua-filters/archive/master.zip && unzip /tmp/pandocker-lua-filters.zip -d /tmp && cp -r /tmp/pandocker-lua-filters*/lua/*.lua /pandoc/filters && clean \
    && wget -O /tmp/pandoc-odt-filters.zip https://github.com/jzeneto/pandoc-odt-filters/archive/master.zip && unzip /tmp/pandoc-odt-filters.zip -d /tmp && cp -r /tmp/pandoc-odt-filters*/*.lua /pandoc/filters && clean \
    && wget -O /tmp/pandoc-filters.zip https://github.com/hason/pandoc-filters/archive/master.zip && unzip /tmp/pandoc-filters.zip -d /tmp && cd /tmp/pandoc-filters* && find . -name '*.lua' | cpio -pdm /pandoc/filters && clean \
    && wget -O /pandoc/filters/panda.lua https://raw.githubusercontent.com/CDSoft/panda/master/src/panda.lua \
    && wget -O /pandoc/filters/columns.lua https://raw.githubusercontent.com/dialoa/columns/master/columns.lua \
    && wget -O /pandoc/filters/abstract-section.lua https://raw.githubusercontent.com/pandoc-ext/abstract-section/main/_extensions/abstract-section/abstract-section.lua \
    && wget -O /pandoc/filters/cito.lua https://raw.githubusercontent.com/pandoc-ext/cito/main/_extensions/cito/cito.lua \
    && wget -O /pandoc/filters/diagram.lua https://raw.githubusercontent.com/pandoc-ext/diagram/main/_extensions/diagram/diagram.lua \
    && wget -O /pandoc/filters/fonts-and-alignment.lua https://raw.githubusercontent.com/pandoc-ext/fonts-and-alignment/main/fonts-and-alignment.lua \
    && wget -O /pandoc/filters/include-files.lua https://raw.githubusercontent.com/pandoc-ext/include-files/main/include-files.lua \
    && wget -O /pandoc/filters/list-table.lua https://raw.githubusercontent.com/pandoc-ext/list-table/main/list-table.lua \
    && wget -O /pandoc/filters/logging.lua https://raw.githubusercontent.com/pandoc-ext/logging/main/logging.lua \
    && wget -O /pandoc/filters/multibib.lua https://raw.githubusercontent.com/pandoc-ext/multibib/main/_extensions/multibib/multibib.lua \
    && wget -O /pandoc/filters/pagebreak.lua https://raw.githubusercontent.com/pandoc-ext/pagebreak/main/pagebreak.lua \
    && wget -O /pandoc/filters/pretty-urls.lua https://raw.githubusercontent.com/pandoc-ext/pretty-urls/main/_extensions/pretty-urls/pretty-urls.lua \
    && wget -O /pandoc/filters/run-lua.lua https://raw.githubusercontent.com/pandoc-ext/run-lua/main/_extensions/run-lua/run-lua.lua \
    && wget -O /pandoc/filters/section-bibliographies.lua https://raw.githubusercontent.com/pandoc-ext/section-bibliographies/main/_extensions/section-bibliographies/section-bibliographies.lua \
    && chown -R user:users /pandoc \
    && clean

COPY rootfs /

CMD [ "pandoc" ]
