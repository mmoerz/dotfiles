#!/bin/sh

TERMINATOR_CFGDIR=$HOME/.config/terminator
test -z "$KEEP_TERMINATOR" || exit 0

mkdir -p $TERMINATOR_CFGDIR 
ln -sf "$DOTFILES/terminator/config" "$TERMINATOR_CFGDIR/config"
