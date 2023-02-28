# My OSX-Dotfiles
- WM: yabai
- Hotkeys: skhd
- Launcher: raycast
- Keyboard-Mapping: Hyperkey
- Terminal: kitty
- Bar: Übersicht
- Trying: SpaceLauncher

## Install
1. Press and hold the power button on your Mac until “Loading startup options” appears. Click Options, then click Continue.
2. In the menu bar, choose Utilities, then Terminal
3. `csrutil disable --with kext --with dtrace --with basesystem`
4. Reboot
5. `sudo nvram boot-args=-arm64e_preview_abi`
6. You can verify that System Integrity Protection is turned off by running `csrutil status`, which returns `System Integrity Protection status: disabled` if it is turned off (it may show unknown for newer versions of macOS when disabling SIP partially)

7. Install dotfiles: 
```bash
alias dotfiles="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME" \
&& git clone --bare git@github.com:joecksma/dotfiles-osx.git $HOME/.config/dotfiles \
&& echo "$HOME/.config/dotfiles" >> $HOME/.gitignore \
&& dotfiles checkout \
&& dotfiles config --local status.showUntrackedFiles no \
&& $HOME/.local/bin/.install-brew.sh
```

