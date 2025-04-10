# To avoid duplicates in your $PATH, you can utilize zsh's array features:
# typeset -aU path: This ensures that the path array (which mirrors the $PATH
# environment variable) only contains unique elements.
typeset -aU path

# Function to append the directory to the path array.
export_to_path() {
  local location="$1"
  local dir="$2"
  if [[ -d "$dir" ]]; then
    # Append the directory to the path array.
    if [[ "$location" == "front" ]]; then
    	path=("$dir" $path)
    else
    	path=($path "$dir")
    fi
    echo $dir added
  fi
}

# Then every time you want to append any path to $PATH just call this function with the path argument.
export_to_path "back" "$HOME/bin"
export_to_path "back" "$HOME/.local/bin"
