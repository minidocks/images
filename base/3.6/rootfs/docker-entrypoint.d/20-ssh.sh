#!/bin/sh
#
# Register SSH key, convert to dropbear format and register known_hosts
#
# (c) 2016 Martin Hasoň <martin.hason@gmail.com>
#

set -e

_USER=${USER_NAME:-$(id -u -n)}

_init() {
    if [ "$_USER" = "$(id -u -n)" ]; then
        _EXEC=""
    elif [ "$(id -u)" = 0 ]; then
        _EXEC="su-exec $_USER"
    else
        exec printf "\033[30;41mUnable to create SSH directory for user \"%s\" (permission denied)\033[0m\n" "$_USER" >&2
    fi

    _HOME=$($_EXEC sh -c 'echo $HOME')
    $_EXEC mkdir -p "$_HOME"/.ssh
}

if [ x"$SSH_ID_DROPBEAR" != x ]; then
    _init
    $_EXEC echo "$SSH_ID_DROPBEAR" | tr -d '\r' > "$_HOME/.ssh/id_dropbear"
elif [ x"$SSH_ID_RSA" != x ]; then
    _init
    $_EXEC echo "$SSH_ID_RSA" | tr -d '\r' > "$_HOME/.ssh/id_rsa"
    $_EXEC dropbearconvert openssh dropbear "$_HOME/.ssh/id_rsa" "$_HOME/.ssh/id_dropbear"
fi

if [ -r "/etc/dropbear/ssh_known_hosts" ]; then
    _init
    $_EXEC touch "$_HOME/.ssh/known_hosts"
    $_EXEC cat "/etc/dropbear/ssh_known_hosts" >> "$_HOME/.ssh/known_hosts"
fi

unset -v _USER _HOME _EXEC
unset -f _init
