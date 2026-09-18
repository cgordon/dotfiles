# Read by login shells only (Ghostty and tmux both start login shells).
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
