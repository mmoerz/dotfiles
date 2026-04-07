if [[ -d "$HOME/.cargo/bin" ]]; then
  CARGO_V="$(cargo --version 2>/dev/null)"
  if [[ "X$CARGO_V" != "X" ]]; then
    export PATH="$PATH:$HOME/.cargo/bin"
  fi
  if command -v sccache > /dev/null  2>&1; then
    export RUSTC_WRAPPER=sccache
  fi
  unset CARGO_V
  unset SCCACHE_V
fi
