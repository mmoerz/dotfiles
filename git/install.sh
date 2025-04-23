#!/bin/sh

# Don't ask ssh password all the time
if [ "$(uname -s)" = "Darwin" ]; then
  git config --global credential.helper osxkeychain
else
  git config --global credential.helper cache
fi

LSB=$(which lsb_release 2>/dev/null)
if [ "X$LSB" != "X" ] ; then
  DIST=$($LSB -i | cut -f2)
  case $DIST in
    Ubuntu)
      ASKPASS=$(find /usr/lib -name "*gnome-ssh-askpass")
      ;;
    ManjaroLinux)
      ASKPASS=$(which ksshaskpass)
      ;;
    *):
      ASKPASS=$(which askpass | grep ssh | head -n1)
      ;;
  esac
  if [ "X$ASKPASS" != "X" ] ; then
    echo sshaskpass found: $ASKPASS
    git config --global core.askpass $ASKPASS
  fi
fi

# better diffs
if which diff-so-fancy > /dev/null 2>&1; then
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

# standard for changes in local and remote is to merge
git config --global pull.rebase
