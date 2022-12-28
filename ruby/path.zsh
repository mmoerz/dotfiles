if [[ -f /usr/bin/ruby ]]; then
  GEM_H="$(ruby -e 'puts Gem.user_dir')"
  if [[ "X$GEM_H" != "X" ]]; then
    export PATH="$PATH:$GEM_H/bin"
  fi
  unset GEM_H
fi
