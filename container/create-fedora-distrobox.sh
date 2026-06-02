#!/usr/bin/env bash
set -euo pipefail

read -p "Enter name: " name
name="${name:-lnx-shell}"
home_dir="$HOME/$name"
REPO_URL="https://github.com/geek-dude/Linux_Configs.git"
REPO_DIR="$home_dir/Documents/Linux_Configs"

packages="
bash
git
zsh
zsh-syntax-highlighting
zsh-autosuggestions
dash
lsd \
fd-find
gcc-c++
ripgrep
fzf
wl-clipboard
xclip
curl
tar
gzip
findutils
coreutils
less
util-linux
procps-ng
hostname
shadow-utils
sudo
which
"

mkdir -p "$home_dir"
mkdir -p "$REPO_DIR"

if [ ! -d "$REPO_DIR/.git" ]; then
  git clone "$REPO_URL" "$REPO_DIR"
else
  git -C "$REPO_DIR" pull --ff-only
fi

distrobox create \
  --name "$name" \
  --image fedora:latest \
  --home "$home_dir" \
  --additional-packages "$packages"

echo
echo "Created Distrobox: $name"
echo "Now run:"
echo "  distrobox enter $name"
echo "  bash ~/Documents/Linux_Configs/container/setup-shell-env.sh"
