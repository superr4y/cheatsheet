HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch
unsetopt autocd beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

setopt correctall

autoload -U promptinit 
promptinit
prompt bigfade theme blue

unset SSH_ASKPASS


# History Settings
HISTSIZE="2000"
HISTFILE="$HOME/.history"
SAVEHIST="$HISTSIZE"
setopt hist_ignore_all_dups
setopt hist_ignore_space
bindkey "^R" history-incremental-search-backward

# aliases

# alias wifi='sudo killall dhclient ; sudo systemctl restart wpa_supplicant ; sudo dhclient wlp4s0'


