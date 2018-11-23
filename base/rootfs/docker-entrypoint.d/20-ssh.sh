#!/bin/sh
#
# Register ssh key, convert to dropbear format and register known_hosts
#
# (c) 2016,2018 Martin Hasoň <martin.hason@gmail.com>

set -e

su_exec()(
    user="${USER_NAME:-$(id -u -n)}"
    if [ "$(id -u)" = 0 ]; then
        su-exec "$user" "$@"
    elif [ "$user" = "$(id -u -n)" ]; then
        "$@"
    else
        exec printf "\\033[30;41mUnable to create SSH directory for user \"%s\" (permission denied)\\033[0m\\n" "$user" >&2
    fi
)

get_home()(
    home="$(su_exec sh -c 'echo $HOME')"
    su_exec mkdir -p "$home/.ssh"
    printf '%s' "$home"
)

if [ -n "$SSH_ID_DROPBEAR" ]; then
    su_exec touch "$(get_home)/.ssh/id_dropbear"
    printf '%s\n' "$SSH_ID_DROPBEAR" | tr -d '\r' > "$(get_home)/.ssh/id_dropbear"
fi

if [ -n "$SSH_ID_RSA" ]; then
    su_exec touch "$(get_home)/.ssh/id_rsa"
    printf '%s\n' "$SSH_ID_RSA" | tr -d '\r' > "$(get_home)/.ssh/id_rsa"
    chmod 600 "$(get_home)/.ssh/id_rsa"
    ! su_exec dropbearconvert openssh dropbear "$(get_home)/.ssh/id_rsa" "$(get_home)/.ssh/id_dropbear" 2>/dev/null
fi

su_exec touch "$(get_home)/.ssh/known_hosts"
if [ -r "/etc/dropbear/ssh_known_hosts" ]; then
    cat "/etc/dropbear/ssh_known_hosts" >> "$(get_home)/.ssh/known_hosts"
fi

unset -f su_exec get_home
