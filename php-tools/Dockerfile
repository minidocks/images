ARG php_version=7.3

FROM minidocks/php:7.1 as v7.1

FROM minidocks/php:7.2 as v7.2

FROM minidocks/php:7.3 as v7.3

FROM v$php_version
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG toolbox_version=1.8.0
ARG php_version

ENV PHP_MEMORY_LIMIT=-1 \
    PHP_PHAR__READONLY=0 \
    PATH="$PATH:/usr/local/bin/QualityAnalyzer/bin:/usr/local/bin/DesignPatternDetector/bin:/usr/local/bin/EasyCodingStandard/bin" \
    TOOLBOX_EXCLUDED_TAGS="exclude-php:${php_version}"

RUN wget -O /usr/local/bin/toolbox "https://github.com/jakzal/toolbox/releases/download/v${toolbox_version}/toolbox.phar" \
    && chmod a+x /usr/local/bin/toolbox && ./docker-entrypoint.sh

RUN apk add curl git && toolbox install --dry-run && toolbox install -vvv && apk del curl git && clean

CMD ["toolbox", "list-tools"]
