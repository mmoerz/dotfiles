if [[ -f "$HOME/.cargo/bin" ]]; then
  CARGO_V="$(cargo --version 2>/dev/null)"
  if [[ "X$CARGO_V" != "X" ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
  fi
  unset CARGO_V
fi