#!/bin/sh
#
# Create user and group
#
# (c) 2016, 2018 Martin Hasoň <martin.hason@gmail.com>
#
# https://github.com/Graham42/mapped-uid-docker
# https://github.com/reduardo7/docker-host-user

set -e

non_empty()(
    for value in "$@"; do
        if [ -n "$value" ]; then
            printf '%s' "$value"
            return
        fi
    done
)

get_suexec()(
    printf '%s' "$SUEXEC" | awk -F: '{print $'$1'}'
)

get_id()(
    printf '%s' "$ID" | sed -E 's/uid=([0-9]+)(\(([^)]+)\))?[^=]+gid=([0-9]+)(\(([^)]+)\))?.*/\'"$1"'/'
)

del_group()(
    if [ -z "$1" ] || [ -z "$(getent group "$1")" ]; then
        return
    fi

    group="$(getent group "$1" | cut -d: -s -f1)"
    for username in $(getent group "$group" | cut -d: -s -f4 | sed "s/,/ /g"); do
        deluser "$username" 2> /dev/null
    done

    username="$(delgroup "$group" 2>&1 | awk '{print $2}' | tr -d "'")"
    if [ -n "$username" ] && [ "$username" != "unknown" ]; then
        deluser "$username" 2> /dev/null
        delgroup "$group"
    fi
)

fix_user_group()(
    exists_group_id="$(getent group "$4" | cut -d: -s -f3)"
    exists_group_name="$(getent group "$3" | cut -d: -s -f1)"
    if [ "$exists_group_id" != "$3" ] || [ "$exists_group_name" != "$4" ]; then
        del_group "$exists_group_name"
        del_group "$4"
        echo "$4:x:$3:$2" >> /etc/group
    fi

    exists_user_id="$(getent passwd "$2" | cut -d: -s -f3)"
    exists_user_name="$(getent passwd "$1" | cut -d: -s -f1)"
    if [ -n "$exists_user_name" ] && [ "$exists_user_name" != "$2" ]; then
        deluser "$exists_user_name"
    fi

    if [ -n "$exists_user_id" ] && [ "$exists_user_id" != "$1" ]; then
        deluser "$2"
    fi

    exists_group_name="$(groups "$2" 2>/dev/null | awk '{print $1}')"
    if [ -n "$exists_group_name" ] && [ "$exists_group_name" != "$4" ]; then
        del_group "$exists_group_name"
    fi

    if [ -z "$(getent passwd "$1")" ]; then
        echo "$2:x:$1:$3::/home/$2:/bin/sh" >> /etc/passwd
    fi

    mkdir -p "/home/$2"
    chown "$1:$3" "/home/$2"

    echo "$2:password" | chpasswd 2>/dev/null
)

export USER_ID="$(non_empty "$USER_ID" "$(get_id 1)" "$(get_suexec 1)" "$([ "$(id -u)" != 0 ] && id -u)" "$([ -z "$USER_NO_PWD" ] && stat -c %u $(pwd))" "$(id -u)")"
export USER_NAME="$(non_empty "$USER_NAME" "$(get_id 3)" "$(get_suexec 3)" "$(getent passwd "$USER_ID" | cut -d: -f1)" "$([ "$(id -u)" != 0 ] && id -u -n 2>/dev/null)" "user")"
export GROUP_ID="$(non_empty "$GROUP_ID" "$(get_id 4)" "$(get_suexec 2)" "$([ "$(id -g)" != 0 ] && id -g)" "$([ -z "$USER_NO_PWD" ] && stat -c %g $(pwd))" "$([ "$USER_ID" != 0 ] && getent group users | cut -d: -s -f3)" "$(id -g)")"
export GROUP_NAME="$(non_empty "$GROUP_NAME" "$(get_id 6)" "$(getent group "$GROUP_ID" | cut -d: -f1)" "$([ "$(id -u)" != 0 ] && id -g -n 2>/dev/null)" "users")"
export USER_MASK="$(non_empty "$USER_MASK" "$(get_suexec 4)" "$(umask)")"

if [ -n "$USER_MASK" ]; then
    umask "$USER_MASK"
fi

if [ "$USER_ID" = 0 ] && [ -n "$USER_NAME" ] && [ "$USER_NAME" != 'root' ]; then
    printf 'User root can not be renamed to %s\n' "$USER_NAME" >&2
    export USER_NAME='root'
    return
fi

if [ "$GROUP_ID" = 0 ] && [ -n "$GROUP_NAME" ] && [ "$GROUP_NAME" != 'root' ]; then
    printf 'Group root can not be renamed to %s\n' "$GROUP_NAME" >&2
    export GROUP_NAME='root'
    return
fi

if [ "$(id -u)" = 0 ]; then
    fix_user_group "$USER_ID" "$USER_NAME" "$GROUP_ID" "$GROUP_NAME" || true
fi

unset -f del_group get_id get_suexec fix_user_group non_empty
