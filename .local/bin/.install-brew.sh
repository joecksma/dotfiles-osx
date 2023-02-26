#!/usr/bin/env bash
export HOMEBREW_NO_ANALYTICS=1

# Install brew
if ! type "brew"; then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ${HOME}/.zprofile
    eval "$(/usr/local/bin/brew shellenv)"
fi


echo "Installing packages..."
brew analytics off
brew update
brew bundle

echo "Starting services..."
brew services start yabai
brew services start shkd

echo "Installing simple-bar..."
git clone https://github.com/Jean-Tinland/simple-bar $HOME/Library/Application\ Support/Übersicht/widgets/simple-bar
echo "To activate simple-bar, choose 'simple-bar-index-jsx' in Übersicht's widgets."
echo "The settings of simple-bar can be opened with cmd+,"