HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# options
setopt appendhistory extendedglob nomatch
unsetopt autocd beep notify
unsetopt correctall
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history



# env vars

# History Settings
HISTSIZE="2000"
HISTFILE="$HOME/.history"
SAVEHIST="$HISTSIZE"

export EDITOR=/usr/bin/vim


bindkey -v


# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
#zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always



autoload -U promptinit 
promptinit
prompt bigfade theme blue

#unset SSH_ASKPASS

bindkey "^R" history-incremental-pattern-search-backward 
bindkey "^E" history-incremental-pattern-search-forward

# aliases
alias ls='ls --color=auto'
alias sl='ls --color=auto'
alias ll='ls -lh'
alias rs='rsync -arv --progress'
alias ssh-p='ssh -o PreferredAuthentications=password'
alias ms='sudo mount -o noexec,nodev,nosuid'
alias ss=systemctl
alias ip='ip -c'
alias ff='find . -type f'
alias -g gg='grep --color -in'
alias -g xg='xargs grep --color -in'
alias -g ...='../../'
alias -g ....='../../../'
alias -g .....='../../../../'

alias v='f -e vim'
alias o='a -e xdg-open'
alias j='fasd_cd -d'
alias arm='arm-none-eabi'

alias vim='nvim'

cclear="free && sync && echo 3 > /proc/sys/vm/drop_caches && free"

# docker 
alias dkc='sudo docker-compose'
alias dk='sudo docker'
dkrm(){
    # removes all not running container
    for c in $(dk ps -a | grep Exited | awk '{print $1}'); do
        dk rm $c;
    done
}
dkrmi(){
    # removes all images with no name
    for c in $(dk images | grep "<none>"| awk '{print $3}'); do
        dk rmi $c;
    done
}

git_checkout(){ for f in $(git status | grep modified | awk '{print $2}'); do git checkout -- "$f"; done}


export PATH=/home/user/anaconda2/bin:$PATH:/home/user/bin
#umask 077
~/bin/tmux_sessions.sh
#eval "$(fasd --init auto)"
