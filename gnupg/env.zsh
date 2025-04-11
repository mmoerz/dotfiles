if [[ `which gpgconf` -eq 0 ]]; then
  unset SSH_AGENT_PID
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  [[ $DEBUG ]] && echo $SSH_AUTH_SOCK
fi
