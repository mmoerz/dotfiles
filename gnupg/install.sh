GNUPGDIR="$HOME/.gnupg"
if [[ ! -d "$GNUPGDIR" ]]; then 
  addgnupghome $USER
  if [[ ! -d "$GNUPGDIR" ]]; then
    mkdir "$GNUPGDIR"
  fi
  rm -f $GNUPGDIR/pubring.kbx
fi
