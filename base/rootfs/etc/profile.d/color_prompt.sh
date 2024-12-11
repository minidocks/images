NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
YELLOW="\[\e[1;33m\]"
NAME="(docker $(id -un):$(id -u):$(id -g))"
if [ "$(id -un)" = root ]; then
  PS1="$RED$NAME$NORMAL \w# "
elif [ "$(stat -c "%U" "$PWD")" != "$(id -un)" ]; then
  PS1="$YELLOW$NAME$NORMAL \w# "
else
  PS1="$GREEN$NAME$NORMAL \w\$ "
fi
