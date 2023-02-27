# vim:fileencoding=utf-8:ft=zsh:foldmethod=marker
#: Initialization of OHMYZSH {{{
export PATH=$HOME/.local/bin:$PATH

# Make sure coreutils are loaded before system commands.
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"


if [ ! -d "$HOME/.oh-my-zsh" ]
then
	echo "Downloading oh-my-zsh and plugins..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use
    git clone https://github.com/redxtech/zsh-fzf-utils ~/.oh-my-zsh/custom/plugins/zsh-fzf-utils
    git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab
    git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ~/.oh-my-zsh/custom/plugins/autoupdate
    git clone https://github.com/3v1n0/zsh-bash-completions-fallback ~/.oh-my-zsh/custom/plugins/zsh-bash-completions-fallback
fi

#: }}}

#: Theming {{{

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#: }}}

#: Plugins {{{
#
plugins=(
    autoupdate
    gitfast
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    common-aliases
    dirhistory
    autojump
    sudo
    virtualenv
    web-search
    fzf
    zsh-fzf-utils
    fzf-tab
    command-not-found
    you-should-use
    zsh-bash-completions-fallback
)
source $ZSH/oh-my-zsh.sh
export YSU_IGNORED_GLOBAL_ALIASES=("G")

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-bindings 'space:toggle'
zstyle ':fzf-tab:complete:(cd|nvim|$EDITOR|sudo $EDITOR|code):*' continuous-trigger 'space'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
    '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:6:wrap
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'
zstyle ':completion:*:descriptions' format '[%d]'


r() {
  if [ "$1" != "" ]; then
    if [ -d "$1" ]; then
      ranger "$1"
    else
      ranger "$(autojump $1)"
    fi
  else
    ranger
  fi
	return $?
}

#: }}}

#: Alias {{{

#remove stupid aliases
unalias "M"
unalias rm
unalias md

alias -g C='| clipcopy'
alias diff="kitty +kitten diff"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
alias dot="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME"
alias dotdiff="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME difftool --no-symlinks --dir-diff"
alias dotundo="/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME checkout --"
alias gitdiff="git difftool --no-symlinks --dir-diff"
alias gitundo="git checkout --"
alias less='less --chop-long-lines --RAW-CONTROL-CHARS --LINE-NUMBERS'
alias ls='lsd'
alias lss='lsd -l --total-size --sizesort -h'
alias zshrc='$EDITOR ~/.zshrc'
alias vimrc='$EDITOR ~/.config/nvim/init.vim'
alias bspwmrc='$EDITOR ~/.config/bspwm/bspwmrc'
alias swayrc='$EDITOR ~/.config/sway/config'
alias hyprrc='$EDITOR ~/.config/hypr/hyprland.conf'
alias sxhkdrc='$EDITOR ~/.config/sxhkd/sxhkdrc'
alias -g vim='$EDITOR'
alias -g vi='$EDITOR'
alias v='$EDITOR'
alias sudov='sudo $EDITOR'
alias c='code'
alias conf='dotfile-editor'
alias dote='dotfile-editor'
alias dota='dotfile-editor --add'
alias o='open'
alias rm='trash-put'
alias -g cat='bat -pp'
alias wget="wget -c"
alias psa="ps aux"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias trr="trash-list | awk '{print NR-1 \" | \" \$0}' | fzf --tac --prompt=\"Restore from trash \" | awk '{system(\"echo \"\$1\"| trash-restore >/dev/null\")}'"
alias tre="echo \"No\nYes\" | fzf --prompt=\"Empty Trash? \" --preview=trash-list --preview-window=up:100 | grep \"Yes\" >/dev/null && echo \"Clearing trash...\" && trash-empty"
alias bt="btop"
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias afk="open /System/Library/CoreServices/ScreenSaverEngine.app"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend" # lock mac
alias ql="qlmanage -p &>/dev/null" # Quick-Look preview files from the command line
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete" # clean recursively all .DS_Store files
alias f='open -a Finder ./' # Opens current directory in MacOS Finder


#: }}}

#: Keybindings {{{

bindkey -s '\el' 'ranger\n' # Alt-l open ranger
bindkey -s '\er' 'ranger\n' # Alt-r open ranger
bindkey '\C-v' edit-command-line # ctrl-v edit cmd in vim
bindkey " " globalias              # expand aliases
bindkey "^ " magic-space           # control-space to bypass alias expansion
bindkey -M isearch " " magic-space # normal space during searches

#: }}}

#: Custom Functions {{{

compdef trash-put=rm

md() { # make directory and change cwd to it
    mkdir $1 && cd $1
}

countdown() {
    start="$(( $(date +%s) + $1))"
    while [ "$start" -ge $(date +%s) ]; do
        ## Is this more than 24h away?
        days="$(($(($(( $start - $(date +%s) )) * 1 )) / 86400))"
        time="$(( $start - `date +%s` ))"
        if [ "$days" = "0" ]; then
            printf "$(date -u -d "@$time" +%H:%M:%S)\r"
        else
            printf '%s day(s) and %s\r' "$days" "$(date -u -d "@$time" +%H:%M:%S)"
        fi
        sleep 0.5
    done
    echo "                       \r"
}

globalias() { # Expand aliases only if they are not at the start of the command
   if [[ $LBUFFER =~ ' (.*)+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}
zle -N globalias

# Set title to current dir / running command
function set-title-precmd() {
  printf "\e]2;%s\a" "${PWD/#$HOME/~} - kitty"
}

function set-title-preexec() {
  printf "\e]2;%s\a" "$1 - kitty"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-preexec

#: }}}

#: Startup {{{
source $HOME/.profile &>/dev/null
#kitty + complete setup zsh | source /dev/stdin
eval "$(starship init zsh)"
#: }}}

