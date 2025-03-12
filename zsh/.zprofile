# Source POSIX profile if present.
if [[ -r ~/.profile ]]; then
	emulate sh -c "source ~/.profile"
fi
