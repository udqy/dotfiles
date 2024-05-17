source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/colored-man-pages.plugin.zsh

export PATH=$PATH:/home/uday/.local/bin
export PATH=$PATH:/home/uday/.spicetify
export TERM=xterm-256color
export MANPAGER='nvim +Man!'
export MOZ_USE_XINPUT2=1

autoload -Uz compinit prompinit
autoload -U colors && colors
compinit

PROMPT="%(?:%{$fg_bold[green]%}🐳 %c ⋗:%{$fg_bold[red]%}🐳 %c ⋗)%{$reset_color%} "

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

HISTFILE=~/.zsh_history
HIST_STAMPS=""
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory
setopt extended_history          # Save timestamps with history
setopt hist_save_no_dups         # Don't save duplicate history entries
setopt hist_ignore_all_dups      # Ignore old command duplicates (in current session)

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu select
zstyle :compinstall filename '${HOME}/.zshrc'
zstyle ':completion:*:*:*:*:descriptions' format '%F{#bde0fe}~~~~ %d ~~~~ %f'
zstyle ':completion:*:*:*:*:corrections' format '%F{#fff2b2}~~~~ %d ~~~~ %f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order commands builtins alias functions 
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:cd:*' ignore-patterns parent pwd
zstyle ':completion::complete:*' gain-privileges 1

alias play="mpv --profile=fast --hwdec=no --sub-font-size=40 --sub-font=monospace "
alias i3conf="nvim ~/.config/i3/config"
alias vlccam="vlc v4l2:///dev/video0"
alias mpvcam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"

alias ls="ls --color=auto"
alias zshconf="nvim ~/.zshrc"
alias his="nvim ~/.zsh_history"

alias brestart="sudo rm -rf /var/lib/bluetooth && sudo systemctl restart bluetooth.service"
alias c="clear"

alias album="yt-dlp -f \"bestaudio\/best\" -ciw -o \"[%(playlist_index)s]%(title)s.%(ext)s\" -v --embed-thumbnail --extract-audio"

alias del="rm -rf"
alias sdel="sudo rm -rf"
alias svim="sudo nvim -u ~/.config/nvim/init.lua"

alias warpconnect="sudo systemctl start warp-svc.service && sleep 2 && warp-cli connect"
alias warpdisconnect="warp-cli disconnect && sudo systemctl stop warp-svc.service"

alias globalpyvenv="source ~/.venv/bin/activate"
alias pyvenv="source .venv/bin/activate"
alias createvenv="python3 -m venv .venv"

alias ins="sudo dnf install"
alias uni="sudo dnf remove"

function \$() { 
  "$@"
}

function \#() { 
  "$@"
}

ls -d -A .*/ && ls -d -A */
