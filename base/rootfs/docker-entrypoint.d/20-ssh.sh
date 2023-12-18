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

register_id_dropbear()(
  if [ -n "$SSH_ID_DROPBEAR" ]; then
    su_exec touch "$(get_home)/.ssh/id_dropbear"
    printf '%s\n' "$SSH_ID_DROPBEAR" | tr -d '\r' > "$(get_home)/.ssh/id_dropbear"
  fi
)

register_id_rsa()(
  if [ -n "$SSH_ID_RSA" ]; then
    su_exec touch "$(get_home)/.ssh/id_rsa"
    printf '%s\n' "$SSH_ID_RSA" | tr -d '\r' > "$(get_home)/.ssh/id_rsa"
    chmod 600 "$(get_home)/.ssh/id_rsa"
    su_exec dropbearconvert openssh dropbear "$(get_home)/.ssh/id_rsa" "$(get_home)/.ssh/id_dropbear" 2>/dev/null || true
  fi
)

register_known_hosts()(
  if [ -r "/etc/dropbear/ssh_known_hosts" ]; then
    su_exec touch "$(get_home)/.ssh/known_hosts"
    if [ -w "$(get_home)/.ssh/known_hosts" ]; then
        cat "/etc/dropbear/ssh_known_hosts" >> "$(get_home)/.ssh/known_hosts"
    fi
  fi
)

register_id_dropbear || true
register_id_rsa || true
register_known_hosts || true

unset -f su_exec get_home register_id_dropbear register_id_rsa register_known_hosts
