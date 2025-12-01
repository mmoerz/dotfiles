#!/bin/sh 
PATH="$PATH:~/.local/bin"
ANTIDOTE=`which antidote 2>/dev/null`
ANTIDOTEDIR="$HOME/.antidote"
GITREPO="https://github.com/mattmc3/antidote.git"
DEBUG=0
[ $DEBUG -gt 0 ] && echo ">$ANTIDOTE<"
if [ "X$ANTIDOTE" = "X" ]; then
  if [ -e "$ANTIDOTEDIR/antidote.zsh" ]; then
    ANTIDOTE="$ANTIDOTEDIR/antidote.zsh"
  fi
fi
if [ "X$ANTIDOTE" != "X" ]; then
  [ $DEBUG -gt 0 ] && echo antidote installed
else
  # install pacman on archlinux
  if [ `which lsb_release 2>/dev/null` ]; then
    DIST=$(lsb_release -i | cut -f2)
  else
    DIST=other
  fi
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
[ -d "$ANTIDOTEDIR" ] || mkdir $ANTIDOTEDIR

