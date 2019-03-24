export VISUAl=vim
export EDITOR="$VISUAL"
ASKPASS=`which ksshaskpass`
if [[ "X$ASKPASS" != "X" ]]; then
export SSH_ASKPASS=$ASKPASS
fi
