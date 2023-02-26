# My OSX-Dotfiles

## Install
alias dotfiles="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME" \
&& git clone --bare git@github.com:joecksma/dotfiles-osx.git $HOME/.config/dotfiles \
&& echo "$HOME/.config/dotfiles" >> $HOME/.gitignore \
&& dotfiles checkout \
&& dotfiles config --local status.showUntrackedFiles no
