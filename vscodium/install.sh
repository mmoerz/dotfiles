#!/bin/bash
#

VSCODIUM_CFGDIR=$HOME/.config/Code/User
CFG=settings.json

if [ ! -e "$VSCODIUM_CFGDIR/$CFG" ]; then
  ln -sf "$DOTFILES/vscodium/$CFG" "$VSCODIUM_CFGDIR/$CFG"
else
  echo "VSCODIUM_CFGDIR/$CFG already exists, remove it for "
  echo "replacing it with symlink version"
fi
