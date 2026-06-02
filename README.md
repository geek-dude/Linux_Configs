# Linux_Configs

My personal Linux shell, editor, and terminal configuration files.

The main goal of this repo is to make living inside a Linux shell as comfortable as possible. I believe a good terminal environment should remove the fear of using the terminal and should make long sessions inside the terminal and an editor as fun as possible. Manually setting up `zsh`, shell aliases, custom scripts, Powerlevel10k, Neovim, plugins, language-server dependencies, colors, and small command-line conveniences every time I move to a new machine is painful and time consuming. This repo collects those configurations and provides a lightweight bootstrap workflow to recreate my shell and editor environment quickly inside a Fedora Distrobox on remote machines.

The setup is highly opinionated and tuned for my own workflow. Anyone is free to fork it, copy pieces from it, or customize it for their own setup. Pull requests are usually not the point of this repo because the configuration is intentionally personal, but I may consider a PR if it is interesting and fits the spirit of the setup.

## What this repo contains

The important parts are:

```text
.
├── .bash_aliases
├── .bashrc
├── .profile
├── .zsh_aliases
├── .zshenv
├── .zshrc
├── .bin/
├── .system_scripts/
├── container/
├── lf/
├── nvim/
├── wezterm.lua
├── alacritty.toml
└── installation_log.txt
```

Broadly:

* `.bashrc`, `.bash_aliases`, `.profile` contain my Bash setup.
* `.zshrc`, `.zshenv`, `.zsh_aliases` contain my Zsh setup.
* `.bin/` contains personal helper scripts.
* `.system_scripts/` contains system-oriented helper scripts useful in a window manager.
* `nvim/` contains my Neovim configuration.
* `lf/` contains my `lf` file manager configuration.
* `wezterm.lua` and `alacritty.toml` contain terminal emulator configs.
* `container/` contains the Fedora Distrobox bootstrap workflow.
* `installation_log.txt` contains notes about my Linux setup, packages, experiments, and fixes.

## Main automated workflow

The most useful automated workflow in this repo is the Fedora Distrobox shell/editor setup.

This is meant for cases where I want a familiar shell and editor environment on a remote PC without manually installing and configuring everything again.

The automated setup currently focuses on:

* Fedora-based Distrobox environment
* Isolated Distrobox home directory
* Bash and Zsh startup files
* Powerlevel10k prompt
* `zsh-autosuggestions`
* `zsh-syntax-highlighting`
* `zsh-you-should-use`
* Personal aliases
* Personal `.bin` scripts
* `lsd`-based colorful `ls` workflow
* Neovim binary installation
* Neovim config symlink
* Basic Neovim dependencies such as `ripgrep`, `fd`, `fzf`, clipboard tools, and compiler support

## Prerequisite: Distrobox

Install Distrobox first using the official instructions:

* Distrobox GitHub: <https://github.com/89luca89/distrobox>
* Official documentation: <https://distrobox.it/>

This repo does not try to document Distrobox installation itself. Set up Distrobox with either Docker or Podman on the host first, then use the steps below.

## Quick setup

After Distrobox is working on the host, run the Fedora Distrobox creation script.

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/geek-dude/Linux_Configs/main/container/create-fedora-distrobox.sh)"
```

The script asks for a Distrobox name. If no name is given, it uses `lnx-shell`.

It creates a Fedora Distrobox with a separate home directory and installs the required shell/editor packages.

Then enter the Distrobox:

```sh
distrobox enter lnx-shell
```

Inside the Distrobox, run the setup script:

```sh
bash ~/Documents/Linux_Configs/container/setup-shell-env.sh
```

After the setup finishes, exit once:

```sh
exit
```

Then re-enter the Distrobox:

```sh
distrobox enter lnx-shell
```

This extra exit/re-enter step ensures the new shell startup files and environment are loaded cleanly.

## First Neovim launch

After entering the configured Distrobox, open Neovim once:

```sh
nvim
```

Wait for `lazy.nvim` to finish installing plugins.

Then open Lazy health:

```vim
:LazyHealth
```

Wait a few seconds for tools and dependencies to finish installing. Some tools, such as language-server or compiler-related components, may be installed during this first run.

After this, the shell and editor environment should be ready. Note that I have tried to keep it minimal by installing only a few plugins, and only the LSPs for `C++` and `Python` are configured at this point. `Lua` comes preinstalled by default. Although the Copilot plugin is installed, you will have to authenticate it with your GitHub account to start using it. If you are AI-phobic and a security freak, you may want to consider uninstalling it instead of authenticating it.

## Manual setup flow summary

For reference, the expected flow is:

```sh
# 1. Create the Distrobox from the host
bash -c "$(curl -fsSL https://raw.githubusercontent.com/geek-dude/Linux_Configs/main/container/create-fedora-distrobox.sh)"

# 2. Enter the Distrobox
distrobox enter lnx-shell

# 3. Run the shell/editor setup inside the Distrobox
bash ~/Documents/Linux_Configs/container/setup-shell-env.sh

# 4. Exit and re-enter once
exit
distrobox enter lnx-shell

# 5. Open Neovim once and let lazy.nvim finish
nvim

# 6. Inside Neovim, run:
:LazyHealth
```

## What the container setup does

The container workflow is intentionally simple.

The Distrobox creation script creates a Fedora container and installs the required packages using Distrobox's package setup mechanism.

The shell setup script then:

* clones or updates this repo under `~/Documents/Linux_Configs`
* clones Powerlevel10k under `~/Documents/powerlevel10k`
* clones `zsh-you-should-use` under `~/Documents/zsh-you-should-use`
* checks out `zsh-you-should-use` version `1.9.0`
* creates the required config directories
* downloads the Neovim binary tarball
* extracts Neovim under `~/.local/opt`
* links `nvim` into `~/.local/bin`
* links Bash and Zsh config files
* links aliases
* links color configuration
* links `.bin` and `.system_scripts`
* links the Neovim config into `~/.config/nvim`

## Why Fedora?

The container uses Fedora because the required shell and editor packages are generally available through `dnf` without much hunting. The command for installing almost everything on Fedora is always the same:

```bash
sudo dnf install <package-name>
```

Whereas on Ubuntu, some tools can be older or may require extra steps, PPAs, manual downloads, or separate version managers. Fedora lies at the sweet spot where the packages are not as old as Ubuntu/Debian and also not ultra-bleeding-edge like Arch. The setup is fragile and has many connected parts, especially package dependencies. While dependencies that are too old may not work, constantly moving parts may also break the system. Hence, Fedora is the best choice for this endeavour.

## Why Distrobox?

Distrobox gives a convenient Linux userland inside the terminal while still integrating with the host. That makes it a good fit for remote machines where I want a familiar shell/editor environment without deeply modifying the host system.

In this setup, I use a custom Distrobox home directory to avoid littering the real host home directory.

## Notes on the Containerfile

The repo may also contain a `Containerfile` under `container/`.

That file is kept mostly as a reference image definition. The current preferred workflow does not require building a custom image. Instead, it starts from `fedora:latest`, installs the required packages during Distrobox creation, and then runs the setup script inside the container.

This keeps the workflow lightweight and avoids maintaining or publishing a custom Docker/Podman image.

## Opinionated choices

Some notable choices in this setup:

* `zsh` as the main shell
* Powerlevel10k prompt
* `lsd` for colorful `ls`-style output
* separate alias files for Bash and Zsh
* personal scripts under `.bin`
* Neovim installed from the official binary tarball
* Neovim configuration managed through this repo
* Fedora as the Distrobox base
* no automated `lf` setup for now

## Updating inside an existing Distrobox

To update the configuration inside an already-created Distrobox:

```sh
cd ~/Documents/Linux_Configs
git pull
bash ~/Documents/Linux_Configs/container/setup-shell-env.sh
```

Then exit and re-enter:

```sh
exit
distrobox enter lnx-shell
```

## Warning

This is a personal dotfiles repo, not a general-purpose distribution or framework.

It may overwrite or back up existing shell configuration files inside the Distrobox home directory. Use it as-is only if you understand what it is doing. Otherwise, fork it and adapt the scripts before running them.

Do not put private secrets, tokens, TOTP seeds, SSH private keys, or machine-specific credentials into the public repo. Keep those in private files outside version control.
