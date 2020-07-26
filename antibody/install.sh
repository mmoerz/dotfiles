#!/bin/sh
if which antibody > /dev/null 2>&1; then
  echo antibody install
else
  # install pacman on archlinux
  DIST=$(lsb_release -i | cut -f2)
  case "$DIST" in
	  ManjaroLinux | arch)	
		  echo "arch based distro found"
		  arch=1;
		  sudo pacman -S antibody
		  ;;
	  Ubuntu)
		  echo "other distro found, fetching script"
		  sudo apt-get -y install golang
		  curl -sL https://git.io/antibody | sh -s
		  ;;
  esac
fi

antibody bundle < "$DOTFILES/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle sindresorhus/pure >> ~/.bundles.txt
antibody bundle < "$DOTFILES/antibody/last_bundles.txt" >> ~/.bundles.txt
antibody update
