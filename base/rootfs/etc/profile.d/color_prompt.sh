NORMAL="\[\e[0m\]"
RED="\[\e[1;31m\]"
GREEN="\[\e[1;32m\]"
if [ "$(id -un)" = root ]; then
  PS1="$RED(docker) $NORMAL\w# "
else
  PS1="$GREEN(docker) $NORMAL\w\$ "
fi
