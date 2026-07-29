#!/bin/bash
DEBUG=0

RUSTDIR="$HOME/.cargo/bin"
RUSTBIN="$RUSTDIR/cargo"
SCCACHEBIN="$RUSTDIR/sccache"

if [ "$DEBUG" -gt 0 ] && [ -e "$RUSTBIN" ]; then
  echo "cargo found"
fi
if [ ! -d "$RUSTDIR" ] || [ ! -e "$RUSTBIN" ]; then
  echo "no rust found in user home>${RUSTDIR}"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

#if [ ! -d "$RUSTDIR" ] || [ ! -e "$SCCACHEBIN" ]; then
#  cargo install sccache
#fi
