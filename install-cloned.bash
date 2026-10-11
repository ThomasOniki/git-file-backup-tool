if [ -z "$PREFIX" ]; then
	printf "\$PREFIX is unset, do you want to install to ~/.local (Y/n)? "
	read -r answer
	[ "$answer" = Y ] || exit 0
	PREFIX="$HOME/.local"
fi

script_dir="${BASH_SOURCE%/*}"
[ "$script_dir" = "${BASH_SOURCE[0]}" ] && script_dir="."

[ -z "$XDG_CONFIG_HOME" ] && XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME/git-file-backup-tool"

cfg="${XDG_CONFIG_HOME:-"$HOME/.config"}/git-file-backup-tool/config.bash"
mkdir -p "${cfg%/*}"
[ -e "$cfg" ] || cp "$script_dir/config.bash" "$cfg"

mkdir -p "$PREFIX/bin"
cp "$script_dir/git-file-backup-tool" "$PREFIX/bin/git-file-backup-tool"

if [ "$(uname -s)" = "Darwin" ]; then
	src="$script_dir/sh.git-file-backup-tool.backup-tool.plist"
	dst="$HOME/Library/LaunchAgents/sh.git-file-backup-tool.backup-tool.plist"
	mkdir -p "${dst%/*}"
	sed -e "s#BINARY#$PREFIX/bin/git-file-backup-tool#" -e "s#LOG_FILE#${XDG_STATE_HOME:-"$HOME/.local/state"}/git-file-backup-tool.log#" "$src" >"$dst"
	launchctl bootstrap "gui/$(id -u)/" "$dst"
fi
