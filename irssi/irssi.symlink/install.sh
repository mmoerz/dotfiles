#!/bin/bash

if [ ! -f $HOME/.irssi/sasl.auth ]; then
  echo -ne "irssi username default is [$USER]:"
  read $IRSSIUSER
  if [ "X$IRSSIUSER" == "X" ]; then
    $IRSSIUSER=$USER
  fi
  echo -ne "irssi password []:"
  read $PASS
  cp $DOTFILES/irssi/sasl.auth $DOTFILES/irssi/irssi.symlink/.
  sed -ie 's/_REPLACE_USER_/$IRSSIUSER/' -e 's/_REPLACE_PASS_/$PASS/' \
    $DOTFILES/irssi/irssi.symlink/sasl.auth
fi
