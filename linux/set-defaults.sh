#!/bin/sh
if [ ! "$(which gsettings)" ]; then
  exit 0
fi

# disable autorun
gsettings set org.gnome.desktop.media-handling autorun-never true

# set terminator as default terminal
if [ "$(which terminator 2>/dev/null)" ]; then
  gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'
else
  echo "terminator (shellwindow) not installed"
fi
