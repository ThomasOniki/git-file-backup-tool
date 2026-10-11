dir="$(mktemp -d)"
git clone --depth=1 https://codeberg.org/ThomasOniki/git-file-backup-tool.git "$dir"
bash "$dir/install-cloned.bash"
rm -r "$dir"
