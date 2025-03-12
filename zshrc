# Initialize pyenv if installed.
if command -v pyenv >/dev/null 2>&1; then
	eval "$(pyenv init -)"
fi

# Postgres
export PGDATA='/opt/homebrew/var/postgresql@16/'

# Case-insensitive tab completions from lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Partial completion suggestions.
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Enable zsh completions after style definitions.
autoload -Uz compinit && compinit

# Source aliases
[[ -r ~/.common_aliases ]] && source ~/.common_aliases
[[ -r ~/.zsh_aliases ]] && source ~/.zsh_aliases
