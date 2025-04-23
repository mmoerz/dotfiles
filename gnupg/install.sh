#/bin/bash
GNUPGDIR="$HOME/.gnupg"
if [[ ! -d "$GNUPGDIR" ]]; then 
  addgnupghome $USER
  if [[ ! -d "$GNUPGDIR" ]]; then
    mkdir "$GNUPGDIR"
  fi
  rm -f "$GNUPGDIR"/pubring.kbx
fi
[ -L "$GNUPGDIR"/gpg-agent.conf ] || \
ln -s "$DOTFILES"/gnupg/gpg-agent.conf "$GNUPGDIR"/gpg-agent.conf

if [[ -z $( ls -A "$GNUPGDIR"/private-keys-v1.d) ]]; then
  echo "need to generate gpg keys next> gpg --full-gen-key --expert"
else
  systemctl --user enable gpg-agent.service gpg-agent.socket \
  gpg-agent-ssh.socket gpg-agent-extra.socket gpg-agent-browser.socket
fi

