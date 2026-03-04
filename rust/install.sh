#!/bin/bash
RUSTDIR="$HOME/.cargo"
if [ ! -d "$RUSTDIR" ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi