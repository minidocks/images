FROM minidocks/php:8.1-nginx AS base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

WORKDIR /var/www

RUN rm -rf * && chown www-data:www-data /var/www
RUN su-exec www-data:www-data composer create-project flarum/flarum . && chmod a+x flarum && clean
RUN su-exec www-data:www-data composer config --no-plugins allow-plugins.php-http/discovery true
RUN su-exec www-data:www-data mkdir -p assets
RUN wget -O public/favicon.ico https://flarum.org/favicon.ico

ENV PATH="/var/www:$PATH" \
    NGINX_CLIENT_MAX_BODY_SIZE=10M \
    PHP_UPLOAD_MAX_FILESIZE=10M \
    PHP_POST_MAX_SIZE=10M \
    UPLOAD_MAX_SIZE=10M

COPY rootfs /

RUN chown -R www-data:www-data /var/www

CMD ["supervise", "php-fpm", "nginx", "crond"]

FROM base AS latest

RUN su-exec www-data:www-data composer require \
        acpl/mobile-tab \
        afrux/forum-widgets-core \
        afrux/online-users-widget \
        antoinefr/flarum-ext-online \
        askvortsov/flarum-checklist \
        askvortsov/flarum-markdown-tables \
        askvortsov/flarum-pwa \
        askvortsov/flarum-rich-text \
        blomstra/fontawesome    \
        blomstra/mark-unread \
        blomstra/user-filter \
        clarkwinkelmann/flarum-ext-author-change \
        clarkwinkelmann/flarum-ext-bookmarks \
        clarkwinkelmann/flarum-ext-composer-page \
        clarkwinkelmann/flarum-ext-follow-tags-prompt \
        clarkwinkelmann/flarum-ext-group-invitation \
        clarkwinkelmann/flarum-ext-group-list \
        clarkwinkelmann/flarum-ext-mailing \
        clarkwinkelmann/flarum-ext-mass-actions \
        clarkwinkelmann/flarum-ext-post-bookmarks \
        clarkwinkelmann/flarum-ext-post-stream-search \
        clarkwinkelmann/flarum-ext-scout \
        clarkwinkelmann/flarum-ext-who-read \
        club-1/flarum-ext-cross-references \
        datlechin/flarum-copy-links \
        datlechin/flarum-discussion-overview \
        datlechin/flarum-landing-page \
        flarumite/simple-discussion-views \
        fof/best-answer \
        fof/byobu \
        fof/custom-footer \
        fof/default-group \
        fof/doorman \
        fof/drafts \
        fof/follow-tags \
        fof/formatting \
        fof/forum-statistics-widget \
        fof/gamification \
        fof/html-errors \
        fof/impersonate \
        fof/linguist \
        fof/merge-discussions \
        fof/moderator-notes \
        fof/nightmode \
        fof/polls \
        fof/pretty-mail \
        fof/profile-image-crop \
        fof/reactions \
        fof/sentry \
        fof/split \
        fof/subscribed \
        fof/upload \
        fof/user-directory \
        fof/webhooks \
        ianm/follow-users \
        justoverclock/flarum-ext-hashtag \
        justoverclock/thread-read-time \
        justoverclock/user-statistics \
        kyrne/whisper \
        luceos/flarum-ext-dofollow \
        nearata/flarum-ext-no-self-likes \
        nearata/flarum-ext-tags-color-generator \
        romanshul/flarum-editor \
        sycho/flarum-move-posts \
        sycho/flarum-profile-cover \
        the-turk/flarum-diff \
        the-turk/flarum-flamoji \
        the-turk/flarum-nodp \
        the-turk/flarum-stickiest \
        tpokorra/flarum-ext-post-notification \
        v17development/flarum-user-badges \
        webbinaro/flarum-calendar \
        xelson/flarum-ext-chat \
        zerosonesfun/direct-links \
        zerosonesfun/flarum-inline-audio \
    && clean
