# Source .bashrc if present and running bash.
if [ -n "$BASH_VERSION" ] && [ -r "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

# Initialize homebrew if installed.
if [ -x /opt/homebrew/bin/brew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set up pyenv if installed.
if command -v pyenv >/dev/null 2>&1; then
	eval "$(pyenv init --path)"
fi
