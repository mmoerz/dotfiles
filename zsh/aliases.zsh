#!/bin/zsh
__reload_dotfiles() {
  echo $path
  PATH="$(command -p getconf PATH):/usr/local/bin"
  # shellcheck disable=SC1090
  source ~/.zshrc
  cd . || return 1
}
alias reload!='__reload_dotfiles'
