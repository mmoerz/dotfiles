#!/bin/sh
if which antibody > /dev/null 2>&1; then
  echo antibody install
else
  # install pacman on archlinux
  curl -sL https://git.io/antibody | sh -s
  if [ "X$UID" = "X0" ]; then
	  pacman -S antibody
  else
	  sudo pacman -S antibody
  fi
fi

antibody bundle < "$DOTFILES/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle sindresorhus/pure >> ~/.bundles.txt
antibody bundle < "$DOTFILES/antibody/last_bundles.txt" >> ~/.bundles.txt
antibody update
