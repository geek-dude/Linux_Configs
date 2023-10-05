#
# ~/.zprofile
#
[[ -f ~/.zshrc ]] && . ~/.zshrc

# Starting sway on login on tty1
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi
