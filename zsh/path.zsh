# To avoid duplicates in your $PATH, you can utilize zsh's array features:
# typeset -aU path: This ensures that the path array (which mirrors the $PATH
# environment variable) only contains unique elements.
typeset -aU path

# Then every time you want to append any path to $PATH just call this function with the path argument.
export_to_path "back" "$HOME/bin"
export_to_path "back" "$HOME/.local/bin"
