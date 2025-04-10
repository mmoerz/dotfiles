#!/bin/sh
ANTIDOTE=`which antidote`
ANTIDOTEDIR="$HOME/.antidote"
GITREPO="https://github.com/mattmc3/antidote.git"
if [ "X$ANTIDOTE" != "X" ]; then
  if [ -e "$ANTIDOTEDIR/antidote.zsh" ]; then
    ANTIDOTE="$ANTIDOTEDIR/antidote.zsh"
  fi
fi
if [ "X$ANTIDOTE" != "X" ]; then
  echo antidote installed
else
  # install pacman on archlinux
  DIST=$(lsb_release -i | cut -f2)
  case "$DIST" in
	  ManjaroLinux | arch)	
		  echo "arch based distro found"
		  arch=1;
		  sudo pacman -S antidote
		  ANTIDOTE=`which antidote`
		  ;;
	  *)
		  echo "other distro $DIST found, fetching script"
		  git clone --depth=1 $GITREPO $ANTIDOTEDIR
		  ANTIDOTE="$ANTIDOTE/antidote.zsh"
		  ;;
  esac
fi
[ -d "$ANTIDOTEDIR"] || mkdir $ANTIDOTEDIR

