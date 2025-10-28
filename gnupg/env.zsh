#which gpgconf 2>&1 >/dev/null
GPGCONF=$(which gpgconf 2>&1 >/dev/null)
#if [[ $? -eq 0 ]]; then
if [[ -f /usr/bin/gpgconf ]]; then
  GPGCONF=/usr/bin/gpgconf
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK="$($GPGCONF --list-dirs agent-ssh-socket)"
  [[ $DEBUG ]] && echo $SSH_AUTH_SOCK
fi
