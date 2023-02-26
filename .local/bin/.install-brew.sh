#!/usr/bin/env bash
export HOMEBREW_NO_ANALYTICS=1

# Install brew
if ! type "brew"; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ()
fi


(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ${HOME}/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

# Install brew packages
brew analytics off
brew update
brew bundle

brew services start yabai
brew services start shkd
