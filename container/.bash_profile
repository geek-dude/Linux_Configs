# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] && [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's hidden private bin if it exists
if [ -d "$HOME/.bin" ] && [[ ":$PATH:" != *":$HOME/.bin:"* ]]; then
  PATH="$HOME/.bin:$PATH"
fi

# Avoid host/container CA certificate path leakage.
# This fixes curl and Neovim plugin download issues inside Distrobox.
unset SSL_CERT_FILE
unset CURL_CA_BUNDLE
unset REQUESTS_CA_BUNDLE
