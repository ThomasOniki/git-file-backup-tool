if [ -z "$PREFIX" ]; then
	printf "\$PREFIX is unset, do you want to uninstall from ~/.local? (Y/n) "
	read -r answer
	[ "$answer" = Y ] || exit
	PREFIX="$HOME/.local"
fi

echo "Run 
rm -rf ${XDG_CONFIG_HOME:-"$HOME/.config"}/git-file-backup-tool
to delete configuration files."
rm -rf "$PREFIX/bin/git-file-backup-tool"

if [ "$(uname -s)" = "Darwin" ]; then
	launchctl bootout "gui/$(id -u)/sh.git-file-backup-tool.backup-tool"
	rm -rf "$HOME/Library/LaunchAgents/sh.git-file-backup-tool.backup-tool.plist"
fi
