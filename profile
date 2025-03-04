# Source .bashrc if present and running bash.
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# Set up homebrew if installed.
if [ -f /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set up pyenv if installed.
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi
