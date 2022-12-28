if [[ -f /usr/bin/ruby ]]; then
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
fi
