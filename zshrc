# Created by newuser for 5.0.7
# Lines configured by zsh-newuser-install
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


unset SSH_ASKPASS

# aliases

alias wifi='sudo killall dhclient ; sudo systemctl restart wpa_supplicant ; sudo dhclient wlp4s0'
