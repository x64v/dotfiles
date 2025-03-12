# Source .bashrc if present and running bash.
if [ -n "$BASH_VERSION" ] && [ -r "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

# Initialize homebrew if installed.
if [ -x /opt/homebrew/bin/brew ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Initialize pnpm if installed and running macOS.
if [ $(cut -c 1-6 <<<"$OSTYPE") = "darwin" ] && command -v pnpm >/dev/null 2>&1; then
	export PNPM_HOME="$HOME/Library/pnpm"
	case ":$PATH:" in
	*":$PNPM_HOME:"*) ;;
	*) export PATH="$PNPM_HOME:$PATH" ;;
	esac
fi

# Initialize postgres if installed...
PG_VERSION=17
# ...via homebrew:
if [ -d "/opt/homebrew/opt/postgresql@$PG_VERSION" ]; then
	export PGDATA="/opt/homebrew/var/postgresql@$PG_VERSION/"
	PG_PATH="/opt/homebrew/opt/postgresql@$PG_VERSION/bin"
	case ":$PATH:" in
	*":$PG_PATH:"*) ;;
	*) export PATH="$PG_PATH:$PATH" ;;
	esac
# ...via system package:
elif [ -d "/etc/postgresql/$PG_VERSION/main" ]; then
	export PGDATA="/etc/postgresql/$PG_VERSION/main/"
fi

# Initialize pyenv if installed.
if command -v pyenv >/dev/null 2>&1; then
	eval "$(pyenv init --path)"
fi

# Source .env if present when launching terminals in VSCode.
if [ "$TERM_PROGRAM" = "vscode" ] && [ -r .env ]; then
	set -a
	source .env && echo "source $(PWD)/.env"
fi
