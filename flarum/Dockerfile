ARG version=2@beta

FROM minidocks/php:8.4-nginx AS base
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

WORKDIR /var/www

ARG version

RUN rm -rf * && chown www-data:www-data /var/www
RUN su-exec www-data:www-data composer create-project flarum/flarum="$version" . && chmod a+x flarum && clean
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
        acpl/my-tags \
        afrux/forum-widgets-core \
        afrux/online-users-widget \
        askvortsov/flarum-checklist \
        askvortsov/flarum-markdown-tables \
        askvortsov/flarum-pwa \
        askvortsov/flarum-rich-text \
        betterflarum/messenger \
        blomstra/fontawesome    \
        blomstra/mark-unread \
        blomstra/search \
        blomstra/user-filter \
        capybash/magicread \
        capybash/magicslider \
        clarkwinkelmann/flarum-ext-advanced-search-highlight \
        clarkwinkelmann/flarum-ext-author-change \
        clarkwinkelmann/flarum-ext-composer-page \
        clarkwinkelmann/flarum-ext-discussion-bookmarks  \
        clarkwinkelmann/flarum-ext-follow-tags-prompt \
        clarkwinkelmann/flarum-ext-group-invitation \
        clarkwinkelmann/flarum-ext-group-list \
        clarkwinkelmann/flarum-ext-mailing \
        clarkwinkelmann/flarum-ext-mass-actions \
        clarkwinkelmann/flarum-ext-post-bookmarks \
        clarkwinkelmann/flarum-ext-post-stream-search \
        clarkwinkelmann/flarum-ext-scout \
        clarkwinkelmann/flarum-ext-who-read \
        convo-extensions/flarum-ext-guest-posting \
        club-1/flarum-ext-cross-references \
        datlechin/flarum-copy-links \
        datlechin/flarum-discussion-overview \
        datlechin/flarum-landing-page \
        dshovchko/flarum-image-dimensions \
        dshovchko/flarum-image-migrate \
        flectar/flarum-fancybox \
        fof/analytics \
        fof/anti-spam \
        fof/best-answer \
        fof/byobu \
        fof/custom-footer \
        fof/default-group \
        fof/default-user-preferences \
        fof/discussion-language \
        fof/discussion-views \
        fof/discussion-thumbnail \
        fof/disposable-emails \
        fof/doorman \
        fof/drafts \
        fof/filter \
        fof/follow-tags \
        fof/formatting \
        fof/forum-statistics-widget \
        fof/frontpage \
        fof/gamification \
        fof/geoip \
        fof/github-autolink \
        fof/horizon \
        fof/html-errors \
        fof/ignore-users \
        fof/impersonate \
        fof/linguist \
        fof/links \
        fof/merge-discussions \
        fof/moderator-notes \
        fof/moderator-warnings \
        fof/nightmode \
        fof/oauth \
        fof/pages \
        fof/polls \
        fof/prevent-necrobumping \
        fof/profile-image-crop \
        fof/reactions \
        fof/redis \
        fof/sentry \
        fof/sitemap \
        fof/split \
        fof/subscribed \
        fof/synopsis \
        fof/terms \
        fof/upload \
        fof/user-bio \
        fof/user-directory \
        fof/webhooks \
        glowingblue/move-posts \
        greatis/login2see-advanced \
        huseyinfiliz/guest \
        huseyinfiliz/modern-footer \
        huseyinfiliz/notificationhub \
        huseyinfiliz/sort-changer \
        huseyinfiliz/sticky-title \
        ianm/follow-users \
        justoverclock/flarum-ext-hashtag \
        justoverclock/thread-read-time \
        justoverclock/user-statistics \
        luceos/flarum-ext-dofollow \
        nearata/flarum-ext-copy-code-to-clipboard \
        nearata/flarum-ext-no-self-likes \
        nearata/flarum-ext-prevent-double-posting \
        nearata/flarum-ext-related-discussions \
        nearata/flarum-ext-tags-color-generator \
        neoncube/flarum-private-messages \
        romanshul/flarum-editor \
        sycho/flarum-advanced-extension-categories \
        sycho/flarum-move-posts \
        sycho/flarum-photoswipe \
        sycho/flarum-private-facade \
        sycho/flarum-profile-cover \
        syntaxoutlaw/threadify \
        the-turk/flarum-diff \
        the-turk/flarum-flamoji \
        the-turk/flarum-nodp \
        the-turk/flarum-stickiest \
        tpokorra/flarum-ext-post-notification \
        v17development/flarum-blog \
        v17development/flarum-user-badges \
        webbinaro/flarum-calendar \
        xelson/flarum-ext-chat \
        zhihe/primary-posts \
    && clean
