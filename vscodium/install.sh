#!/bin/bash
#

VSCODE_CFGDIR=$HOME/.config/Code/User
VSCODIUM_CFGDIR=$HOME/.var/app/com.vscodium.codium/config/VSCodium/User
CFG=settings.json
SOURCE=settings.json

if [ ! -e "$VSCODIUM_CFGDIR/$CFG" ]; then
  ln -sf "$DOTFILES/vscodium/$SOURCE" "$VSCODIUM_CFGDIR/$CFG"
else
  echo "\033[0;31m"
  echo "$VSCODIUM_CFGDIR/$CFG"
  echo "already exists, remove it for dotfile version symlink"
  echo "\033[0m"
fi
