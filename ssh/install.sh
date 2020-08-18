#!/bin/bash

USER_SYSTEMD_CFGDIR="$HOME/.config/systemd/user/"

if [ ! -d "$USER_SYSTEMD_CFGDIR" ]; then
  mkdir -p "$USER_SYSTEMD_CFGDIR"
fi
if [ ! -L "$USER_SYSTEMD_CFGDIR/ssh-agent.service" ] ; then
  rm -f "$USER_SYSTEMD_CFGDIR/ssh-agent.service"
  ln -sf "$DOTFILES/ssh/ssh-agent.service" \
    "$USER_SYSTEMD_CFGDIR/ssh-agent.service"
fi

COUNT=$(grep -c "^SSH_AUTH_SOCK DEFAULT" ~/.pam_environment)
if [ $COUNT -gt 0 ]; then
  sed -i -e \
    's%\(SSH_AUTH_SOCK DEFAULT\).*%\1="\${XDG_RUNTIME_DIR}/ssh-agent.socket"%' \
    ~/.pam_environment
#  awk '!(/^SSH_AUTH_SOCK DEFAULT=.*$/ && ++cnt>=2)' ~/.pam_environment
else 
  echo 'SSH_AUTH_SOCK DEFAULT="${XDG_RUNTIME_DIR}/ssh-agent.socket"' >> \
    ~/.pam_environment
fi

systemctl enable --user ssh-agent.service
systemctl start --user ssh-agent.service

