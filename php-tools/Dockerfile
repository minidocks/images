ARG php_version=8.1
ARG toolbox_version=1.59.0

FROM minidocks/php:7.3 as v7.3

FROM minidocks/php:7.4 as v7.4

FROM minidocks/php:8.0 as v8.0

FROM minidocks/php:8.1 as v8.1

FROM v$php_version
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

ARG php_version
ARG toolbox_version

ENV PHP_DATE__TIMEZONE="Europe/Prague" \
    PHP_MEMORY_LIMIT=-1 \
    PHP_PHAR__READONLY=0 \
    PHP_PCOV__ENABLED=0 \
    PATH="$PATH:/usr/local/bin/QualityAnalyzer/bin:/usr/local/bin/DesignPatternDetector/bin:/usr/local/bin/EasyCodingStandard/bin" \
    TOOLBOX_EXCLUDED_TAGS="exclude-php:${php_version}"

RUN version="$(if [ "7.3" == "$php_version" ]; then echo "1.50.0"; else echo "$toolbox_version"; fi)" \
    && wget -O /usr/local/bin/toolbox "https://github.com/jakzal/toolbox/releases/download/v$version/toolbox.phar" \
    && chmod a+x /usr/local/bin/toolbox && ./docker-entrypoint.sh

RUN apk add curl gpg gnupg-dirmngr gpg-agent git "php$([ "8.1" == "$php_version" ] && echo "81" || echo "${php_version%%.*}")-pecl-ast" \
    && toolbox install --dry-run && toolbox install -vvv && apk del curl gpg gnupg-dirmngr gpg-agent git && clean

ENV PHP_AUTO_PREPEND_FILE="$COMPOSER_HOME/vendor/autoload.php"

RUN composer global require symfony/var-dumper && ./docker-entrypoint.sh && clean

CMD ["toolbox", "list-tools"]
