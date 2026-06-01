# Linux_Configs/container/setup-shell-env.sh
#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/geek-dude/Linux_Configs.git"
REPO_DIR="$HOME/Linux_Configs"
P10K_DIR="$HOME/powerlevel10k"
YSU_DIR="$HOME/zsh-you-should-use"

backup_if_real_file_or_dir() {
  local path="$1"

  # If it does not exist, nothing to back up.
  [ -e "$path" ] || [ -L "$path" ] || return 0

  # If it is already a symlink, remove it. This makes the script idempotent.
  if [ -L "$path" ]; then
    rm -f "$path"
    return 0
  fi

  # If it is a real file/dir, keep a backup.
  local backup="${path}_backup"
  local i=1

  while [ -e "$backup" ] || [ -L "$backup" ]; do
    backup="${path}_backup_${i}"
    i=$((i + 1))
  done

  mv "$path" "$backup"
}

link_file() {
  local src="$1"
  local dst="$2"

  backup_if_real_file_or_dir "$dst"
  ln -s "$src" "$dst"
}

link_dir() {
  local src="$1"
  local dst="$2"

  backup_if_real_file_or_dir "$dst"
  ln -s "$src" "$dst"
}

cd "$HOME"

if [ ! -d "$REPO_DIR/.git" ]; then
  git clone "$REPO_URL" "$REPO_DIR"
else
  git -C "$REPO_DIR" pull --ff-only
fi

if [ ! -d "$P10K_DIR/.git" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
  git -C "$P10K_DIR" pull --ff-only
fi

if [ ! -d "$YSU_DIR/.git" ]; then
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git "$YSU_DIR"
fi

git -C "$YSU_DIR" fetch --tags
git -C "$YSU_DIR" checkout 1.9.0

link_file "$REPO_DIR/container/.bash_profile" "$HOME/.bash_profile"
link_file "$REPO_DIR/container/.bashrc" "$HOME/.bashrc"
link_file "$REPO_DIR/.bash_aliases" "$HOME/.bash_aliases"

link_file "$REPO_DIR/container/.zshenv" "$HOME/.zshenv"
link_file "$REPO_DIR/container/.zshrc" "$HOME/.zshrc"
link_file "$REPO_DIR/container/.p10k.zsh" "$HOME/.p10k.zsh"
link_file "$REPO_DIR/.zsh_aliases" "$HOME/.zsh_aliases"

link_file "$REPO_DIR/.dircolors" "$HOME/.dircolors"
link_file "$REPO_DIR/.LESS_TERMCAP" "$HOME/.LESS_TERMCAP"

link_dir "$REPO_DIR/.bin" "$HOME/.bin"
link_dir "$REPO_DIR/.system_scripts" "$HOME/.system_scripts"

echo
echo "Shell environment setup complete."
echo "Restart the shell or run: exec zsh"
