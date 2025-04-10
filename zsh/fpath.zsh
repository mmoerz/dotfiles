#!/bin/zsh
#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($DOTFILES/*) if [ -d "$topic_folder" ]; then
  fpath=($topic_folder $fpath)
fi
# U -disable alias expansion, z force zsh-style autoloading
autoload -Uz "$DOTFILES"/functions/*(:t)
