#!/bin/sh
set -e

chown weblate:weblate /app/data

# Generate secret
if [ ! -f /app/data/secret ]; then
    # https://github.com/django/django/blob/1.10.2/django/utils/crypto.py#L54-L56
    python3 -c "from django.utils.crypto import get_random_string; print(get_random_string(50))" > /app/data/secret
fi

printf "Waiting for database\n"
wait-for "$(parse_url "$DATABASE_URL" host):$(parse_url "$DATABASE_URL" port)"

printf "Database migration\n"
# Migration to 3.0
weblate showmigrations --plan > /tmp/migrations.txt
if  grep -Fq '[X]  auth.0001_initial' /tmp/migrations.txt && grep -Fq '[ ]  weblate_auth.0001_initial' /tmp/migrations.txt ; then
    sed -i 's/^AUTH_USER_MODEL/#AUTH_USER_MODEL/' /app/etc/settings.py
    # To avoid problems when migrating from old version
    weblate migrate lang
    weblate migrate weblate_auth 0001
    sed -i 's/^#AUTH_USER_MODEL/AUTH_USER_MODEL/' /app/etc/settings.py
fi
rm /tmp/migrations.txt

weblate migrate
weblate collectstatic --noinput
if [ -n "$WEBLATE_ADMIN_PASSWORD" ] ; then
    # This will fail on consequent runs
    weblate createadmin --password="$WEBLATE_ADMIN_PASSWORD" --update --email="$WEBLATE_ADMIN_EMAIL" --name="$WEBLATE_ADMIN_NAME" || true
fi
if [ -n "$WEBLATE_ALLOWED_HOSTS" -a "$WEBLATE_ALLOWED_HOSTS" != '*' ] ; then
    weblate changesite --set-name "${WEBLATE_ALLOWED_HOSTS%%,*}"
fi

# uswgi dir
mkdir -p /run/uwsgi/app/weblate
chown weblate:weblate -R /run/uwsgi/app/weblate /app/data
