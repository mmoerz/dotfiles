#!/bin/zsh
# Force rehash when comman not found
_force_rehash() {
  (( CURRENT == 1 )) && rehash
  return 1
}

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' menu select=10
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/natoka/.zshrc'
