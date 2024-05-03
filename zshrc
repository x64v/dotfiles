# Initialize pyenv if exists.
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Postgres
export PGDATA='/opt/homebrew/var/postgresql@14/'

# Case-insensitive tab completions from lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Partial completion suggestions.
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Enable zsh completions after style definitions.
autoload -Uz compinit && compinit

# Source aliases
[[ -f ~/.common_aliases ]] && . ~/.common_aliases
[[ -f ~/.zsh_aliases ]] && . ~/.zsh_aliases
