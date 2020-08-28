#!/bin/bash

SASL_AUTH_FILE=$DOTFILES/irssi/irssi.symlink/sasl.auth

if [ ! -f $SASL_AUTH_FILE ]; then
  echo -ne "irssi username default is [$USER]:"
  read IRSSIUSER
  if [ "X$IRSSIUSER" == "X" ]; then
    IRSSIUSER=$USER
  fi
  echo -ne "irssi password []:"
  read PASS
  cp $DOTFILES/irssi/sasl.auth $SASL_AUTH_FILE
  sed -ie "s/_REPLACE_USER_/$IRSSIUSER/" $SASL_AUTH_FILE
  sed -ie "s/_REPLACE_PASS_/$PASS/" $SASL_AUTH_FILE
fi
