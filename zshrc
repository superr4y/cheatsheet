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

zstyle ':completion:*:descriptions' format '%U%B%d%b%u' 
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'


autoload -U promptinit 
promptinit
prompt bigfade theme blue

unset SSH_ASKPASS

bindkey "^R" history-incremental-search-backward

# aliases
alias ls='ls --color=auto'
alias ll='ls -lh'
alias rs='rsync -arv --progress'

# alias wifi='sudo killall dhclient ; sudo systemctl restart wpa_supplicant ; sudo dhclient wlp4s0'

# funcitons
h() { if [ -z "$*" ]; then history 1; else history 1 | egrep "$@"; fi; }

h2zim() {
    name=$(date +"%d_%m_%Y")

    prefix="/home/user/share/notes/linux"
    history_index="$prefix/history.txt"
    history_entry="$prefix/history/${name}.txt"

    # create zim wiki entry if not already exist
    if ! grep "$name"  "$history_index"; then
        echo "[[+$name]]" >> $history_index
    fi

    # you may setopt inc_append_history and share_history in .zshrc
    # save the history to zim wiki
    # cat ~/.history >> $history_entry
    history -n -E >> $history_entry

    # clear the history
    echo "" > ~/.history
}


