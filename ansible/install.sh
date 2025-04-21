#!/bin/sh
ANSIBLE=`which ansible 2>/dev/null`
ANSIBLEDIR="$HOME/.ansible"
DEBUG=0
if [ "X$ANSIBLE" != "X" ]; then
  [ $DEBUG -gt 0 ] && echo ansible is installed
else
  # install pacman on archlinux
  if [ `which lsb_release` ]; then
    DIST=$(lsb_release -i | cut -f2)
  else
    DIST=other
  fi
  case "$DIST" in
	  ManjaroLinux | arch)	
		  echo "arch based distro found"
		  arch=1;
		  sudo pacman -S ansible
		  ANTIDOTE=`which ansible`
		  ;;
	  *)
		  echo "other distro $DIST found, fetching script"
      pip3 install --user ansible
		  activate-global-python-argcomplete --user
      ansible --version | head -n1
		  ;;
  esac
fi



