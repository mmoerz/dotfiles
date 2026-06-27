#!/bin/zsh

if command -v flatpak >/dev/null 2>&1; then 
  FLATPAK=$(command -v flatpak)
  APPS="$($FLATPAK list --app --columns=application)"
  typeset -A FLATPAK_ALIASES
  FLATPAK_ALIASES=(
    vscodium com.vscodium.codium
    androidstudio com.google.AndroidStudio
    discord com.discordapp.Discord
    inkscape org.inkscape.Inkscape
    blender org.blender.Blender
    zed dev.zed.Zed
    zed-preview dev.zed.Zed-Preview
  )

  for alias_name app_id in ${(kv)FLATPAK_ALIASES}; do
    if [[ "$APPS" == *"$app_id"* ]]; then
      alias "$alias_name"="flatpak run $app_id"
    fi
  done

  unset FLATPAK APPS FLATPAK_ALIASES
fi
