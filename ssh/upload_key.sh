#!/bin/bash

if [[ "$#" -ne 2 ]]; then
  echo "Usage: $0 <key file> <user@server>"
  exit 1
fi

keyfile="$1" 
server="$2"

scp "$keyfile" "$server":"tmp.pub"
ssh "$server" "mkdir ~/.ssh; chmod 700 ~/.ssh; cat ~/tmp.pub >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys; rm ~/tmp.pub"
