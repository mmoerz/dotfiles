#!/bin/sh
if which antibody > /dev/null 2>&1; then
  echo antibody install
else
  # install pacman on archlinux
  pacman -S antibody
fi

antibody bundle < "$DOTFILES/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle sindresorhus/pure >> ~/.bundles.txt
antibody bundle < "$DOTFILES/antibody/last_bundles.txt" >> ~/.bundles.txt
