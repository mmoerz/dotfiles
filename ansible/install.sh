#!/bin/sh
PATH=$PATH:~/.local/bin
ANSIBLE=`which ansible 2>/dev/null`
ANSIBLEDIR="$HOME/.ansible"
DEBUG=1
[ $DEBUG -gt 1 ] && echo ">$ANSIBLE<"
if [ "X$ANSIBLE" != "X" ]; then
  [ $DEBUG -gt 0 ] && echo ansible is installed
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



