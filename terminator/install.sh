#!/bin/sh

TERMINATOR_CFGDIR=$HOME/.config/terminator/config

mkdir -p $TERMINATOR_CFGDIR 
cp $DOTFILES/terminator/terminator.config $TERMINATOR_CFGDIR/.
