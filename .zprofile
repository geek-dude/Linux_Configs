#
# ~/.zprofile
#
[[ -f ~/.zshrc ]] && . ~/.zshrc

# Starting sway on login on tty1
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi

# Including system scripts in Path; Required by Qtile.
if [ -d "$HOME/.system_scripts" ] ; then
    PATH="$HOME/.system_scripts${PATH:+:${PATH}}"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin${PATH:+:${PATH}}"
fi
