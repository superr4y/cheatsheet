#!/bin/bash
# simple upload some config files server
if [ $# -ne 1 ]; then
    echo "Usage: $0 <ssh-login>"
    exit 1
fi

ssh_login="$1"

scp ~/.vimrc "$ssh_login":.vimrc
scp ~/.tmux.conf "$ssh_login":.tmux.conf
