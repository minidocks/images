#!/bin/sh
#
# Create user and group
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>

set -e

if [ x"$SUEXEC" != x ]; then
    SUEXEC_USER_ID=$(echo "$SUEXEC" | awk -F: '{print $1}')
    SUEXEC_GROUP_ID=$(echo "$SUEXEC" | awk -F: '{print $2}')
    SUEXEC_USER_NAME=$(echo "$SUEXEC" | awk -F: '{print $3}')
    SUEXEC_UMASK=$(echo "$SUEXEC" | awk -F: '{print $4}')
fi

export USER_ID=${USER_ID:-${SUEXEC_USER_ID:-$(id -u)}}
export USER_NAME=${USER_NAME:-${SUEXEC_USER_NAME}}
export USER_MASK=${USER_MASK:-${SUEXEC_UMASK:-$(umask)}}

if [ "$(id -g)" != 0 ] || [ "$USER_ID" = 0 ]; then
    export GROUP_ID=${GROUP_ID:-${SUEXEC_GROUP_ID:-$(id -g)}}
else
    export GROUP_ID=${GROUP_ID:-${SUEXEC_GROUP_ID:-$(getent group users | awk -F: '{print $3}')}}
fi

if [ x"$USER_MASK" != x ]; then
    umask "$USER_MASK"
fi

if [ "$(id -u)" != 0 ]; then
    export USER_NAME=${USER_NAME:-$(id -u -n)}
    export GROUP_NAME=${GROUP_NAME:-$(id -g -n)}
    return
fi

if [ "$USER_ID" = 0 ] && [ "$USER_NAME" != "root" ] && [ x"$USER_NAME" != x ]; then
    printf "User root can not be renamed to %s\n" "$USER_NAME" >&2
    return
fi

if [ "$GROUP_ID" = 0 ] && [ "$GROUP_NAME" != "root" ] && [ x"$GROUP_NAME" != x ]; then
    printf "Group root can not be renamed to %s\n" "$GROUP_NAME" >&2
    return
fi

_del_group(){
    if [ x"$(getent group "$1")" = x ]; then
        return
    fi

    for _USER_NAME in $(getent group "$1" | awk -F: '{print $4}' | sed "s/,/ /g"); do
        deluser "$_USER_NAME" 2> /dev/null
    done

    _USER_NAME="$(delgroup "$1" 2>&1 | awk '{print $2}' | tr -d "'")"
    if [ x"$_USER_NAME" != x ]; then
        deluser "$_USER_NAME" 2> /dev/null
        delgroup "$1"
    fi

    unset -v _USER_NAME
}

# group name
_GROUP_NAME=$(getent group "$GROUP_ID" | awk -F: '{print $1}')
if [ x"$_GROUP_NAME" = x ]; then
    if [ x"$GROUP_NAME" = x ]; then
        export GROUP_NAME=users
    fi

    _del_group "$GROUP_NAME"
    addgroup -g "$GROUP_ID" -S "$GROUP_NAME"
elif [ x"$GROUP_NAME" = x ]; then
    export GROUP_NAME="$_GROUP_NAME"
elif [ x"$_GROUP_NAME" != x"$GROUP_NAME" ]; then
    _del_group "$_GROUP_NAME"
    _del_group "$GROUP_NAME"
    addgroup -g "$GROUP_ID" -S "$GROUP_NAME"
fi

# user name
_USER_NAME=$(getent passwd "$USER_ID" | awk -F: '{print $1}')
if [ x"$_USER_NAME" = x ]; then
    if [ x"$USER_NAME" = x ]; then
        export USER_NAME=user
    fi

    if [ x"$(getent passwd "$USER_NAME")" != x ]; then
        deluser "$USER_NAME"
    fi
elif [ x"$USER_NAME" = x ]; then
    export USER_NAME="$_USER_NAME"
elif [ x"$_USER_NAME" != x"$USER_NAME" ]; then
    deluser "$_USER_NAME"
fi

_GROUP_NAME=$(groups "$USER_NAME" 2>/dev/null | awk '{print $1}')
if [ x"$_GROUP_NAME" != x ] && [ x"$_GROUP_NAME" != x"$GROUP_NAME" ]; then
    _del_group "$_GROUP_NAME"
fi

if [ x"$(getent passwd "$USER_ID")" = x ]; then
    adduser -u "$USER_ID" -D -S -G "$GROUP_NAME" "$USER_NAME"
fi
