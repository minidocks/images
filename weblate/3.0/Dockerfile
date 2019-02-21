FROM minidocks/base:3.9-build

RUN apk --update add python3-dev && pip3 install wheel siphashc rjsmin rcssmin python-Levenshtein hiredis \
    && pip3 wheel --wheel-dir=/tmp/wheelhouse siphashc rjsmin rcssmin python-Levenshtein

FROM minidocks/python:3.6-uwsgi
LABEL maintainer="Martin Hasoň <martin.hason@gmail.com>"

RUN addgroup -S weblate && adduser -S -G weblate weblate

COPY --from=0 /tmp/wheelhouse/* /tmp/

ENV WEBLATE_VERSION=3.0.1

RUN apk --update add git hiredis py3-lxml py3-pillow py3-psycopg2 py3-pyldap \
    && pip install /tmp/*.whl weblate==$WEBLATE_VERSION babel phply python-bidi pyuca pyyaml django-redis django-debug-toolbar django-environ "django-auth-ldap<1.4.0" \
    && rm -rf /var/cache/apk/* /tmp/* $PIP_CACHE_DIR/* && pyclean

COPY rootfs /

RUN chmod a+rwx /app/data && ln -s /app/etc/settings.py /usr/lib/python3.6/site-packages/weblate/settings.py

ENV DJANGO_SETTINGS_MODULE="weblate.settings"

WORKDIR /app

EXPOSE 80

CMD [ "supervise", "crond", "nginx", "uwsgi" ]
