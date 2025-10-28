#!/bin/zsh

if which flatpak >/dev/null 2>&1; then 
  FLATPAK=$(which flatpak)

if [ $($FLATPAK list --app | /usr/bin/grep vscodium | /usr/bin/wc -l) = "1" ]; then
  alias vscodium="flatpak run com.vscodium.codium"
fi

fi
