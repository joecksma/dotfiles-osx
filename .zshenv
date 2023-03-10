# vim:fileencoding=utf-8:ft=zsh:foldmethod=marker

#: Exports {{{

skip_global_compinit=1

export ZSH_COMPDUMP="${Home}/.cache/zsh/.zcompdump-${HOST}-${ZSH_VERSION}"
#export TERM="xterm-256color"
export ZSH=~/.oh-my-zsh
export OPENCV_LOG_LEVEL=ERROR
export EDITOR=nvim
export VISUAL=nvim
export RANGER_LOAD_DEFAULT_RC=FALSE
export HOMEBREW_NO_ANALYTICS=1

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export HOMEBREW_BREWFILE=$XDG_CONFIG_HOME/brewfile/Brewfile

export EDITOR="nvim"
export VISUAL="code"

#: }}}

#: Color Man pages (see man terminfo) {{{

export LESS_TERMCAP_mb=$(tput bold; tput setaf 4) # Start blinking [blue]
export LESS_TERMCAP_md=$(tput bold; tput setaf 4) # Start bold [blue]
export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 2) # Start stand out [yellow]
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) # End standout
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # Start underline [red]
export LESS_TERMCAP_ue=$(tput sgr0) # End Underline
export LESS_TERMCAP_me=$(tput sgr0) # End bold, blinking, standout, underline

#: }}}

#: lf file manager icons {{{

export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.Trash=:\
*.atom=:\
*.bashprofile=:\
*.bashrc=:\
*.git=:\
*.gitattributes=:\
*.gitconfig=:\
*.github=:\
*.gitignore=:\
*.gitmodules=:\
*.rvm=:\
*.vimrc=:\
*.vscode=:\
*.zshrc=:\
*.apk=:\
*.apk=:\
*.avi=:\
*.avro=:\
*.awk=:\
*.bash=:\
*.bash_history=:\
*.bash_profile=:\
*.bashrc=:\
*.bat=:\
*.bmp=:\
*.c=:\
*.c++=:\
*.cc=:\
*.cfg=:\
*.clj=:\
*.cljs=:\
*.cls=:\
*.coffee=:\
*.conf=:\
*.cp=:\
*.cpp=:\
*.cs=:\
*.cshtml=:\
*.csproj=:\
*.csx=:\
*.csh=:\
*.css=:\
*.csv=:\
*.cxx=:\
*.d=:\
*.dart=:\
*.db=:\
*.diff=:\
*.doc=:\
*.docx=:\
*.ds_store=:\
*.dump=:\
*.ebook=:\
*.editorconfig=:\
*.ejs=:\
*.elm=:\
*.env=:\
*.eot=:\
*.epub=:\
*.erb=:\
*.erl=:\
*.exe=:\
*.ex=:\
*.exs=:\
*.fish=:\
*.flac=:\
*.flv=:\
*.font=:\
*.gdoc=:\
*.gemfile=:\
*.gemspec=:\
*.gform=:\
*.gif=:\
*.git=:\
*.go=:\
*.gradle=:\
*.gsheet=:\
*.gslides=:\
*.guardfile=:\
*.gz=:\
*.h=:\
*.hbs=:\
*.hpp=:\
*.hs=:\
*.htm=:\
*.html=:\
*.hxx=:\
*.ico=:\
*.image=:\
*.iml=:\
*.ini=:\
*.ipynb=:\
*.jar=:\
*.java=:\
*.jpeg=:\
*.jpg=:\
*.js=:\
*.json=:\
*.jsx=:\
*.ksh=:\
*.less=:\
*.lhs=:\
*.license=:\
*.localized=:\
*.lock=:\
*.log=:\
*.lua=:\
*.m4a=:\
*.markdown=:\
*.md=:\
*.mkd=:\
*.mkv=:\
*.mobi=:\
*.mov=:\
*.mp3=:\
*.mp4=:\
*.mustache=:\
*.npmignore=:\
*.ogg=:\
*.ogv=:\
*.otf=:\
*.pdf=:\
*.php=:\
*.pl=:\
*.png=:\
*.ppt=:\
*.pptx=:\
*.procfile=:\
*.properties=:\
*.ps1=:\
*.psd=:\
*.pxm=:\
*.py=:\
*.pyc=:\
*.r=:\
*.rakefile=:\
*.rar=:\
*.razor=:\
*.rb=:\
*.rdata=:\
*.rdb=:\
*.rdoc=:\
*.rds=:\
*.readme=:\
*.rlib=:\
*.rmd=:\
*.rs=:\
*.rspec=:\
*.rspec_parallel=:\
*.rspec_status=:\
*.rss=:\
*.ru=:\
*.rubydoc=:\
*.sass=:\
*.scala=:\
*.scss=:\
*.sh=:\
*.shell=:\
*.slim=:\
*.sln=:\
*.sql=:\
*.sqlite3=:\
*.styl=:\
*.stylus=:\
*.svg=:\
*.swift=:\
*.tar=:\
*.tex=:\
*.tiff=:\
*.ts=:\
*.tsx=:\
*.ttf=:\
*.twig=:\
*.txt=:\
*.video=:\
*.vim=:\
*.vue=﵂:\
*.wav=:\
*.webm=:\
*.webp=:\
*.windows=:\
*.woff=:\
*.woff2=:\
*.xls=:\
*.xlsx=:\
*.xml=:\
*.xul=:\
*.yaml=:\
*.yml=:\
*.zip=:\
*.zsh=:\
*.zsh-theme=:\
*.zshrc=:\
"

#: }}}
