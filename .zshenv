#
# ~/.zshenv
#

# Colors
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Get color support for 'less'
export LESS="--RAW-CONTROL-CHARS"
# Fixes a bug related to groff which is preventing man from displaying color
# https://bbs.archlinux.org/viewtopic.php?id=287185
# https://gitlab.archlinux.org/archlinux/packaging/packages/groff/-/commit/958e73c5086d99c87c0d2319088931e1771a42d8
export GROFF_NO_SGR=1

# Use colors for less, man, etc.
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Commands and Aliases
# Add user's aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Add user's commands
if [ -d "$HOME/.bin/" ]; then
    for file in "$HOME/.bin/"*; do
        . "$file"
    done
fi

#Some environment variables
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="google-chrome-stable"
export PAGER="less"
export WM="qtile"

#Prompt
#PS1='\[\e[01;32m\]\n\w\[\e[01;31m\]\n\T\[\e[00;33m\] \u\[\e[01;36m\] -> \[\e[00;37m\]'
