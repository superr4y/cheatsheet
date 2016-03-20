#!/bin/bash

profile_apps=("firefox" "thunderbird" "google-chrome-stable" "vlc" "hexchat")

#"okular"  "quodlibet"

function create_jail {
    app="$1"
    firejail_args="$2"
    if ! grep -iq "firejail" "/usr/bin/$app"; then
        mv "/usr/bin/$app" "/usr/bin/.$app"
        echo "/usr/bin/firejail $firejail_args /usr/bin/.$app \"\$@\"" > "/usr/bin/$app"
        chmod +x "/usr/bin/$app"
        echo "[+] /usr/bin/$app => firejailed"
    else
        echo "[!] /usr/bin/$app => already firejailed"
    fi
}

for i in ${profile_apps[@]}; do
    create_jail "$i" "--profile=/etc/firejail/$i.profile"
    ## check if app is already firejailed
    #if ! grep -iq "firejail" "/usr/bin/$i"; then
    #    mv "/usr/bin/$i" "/usr/bin/.$i"
    #    # TODO: Do I need to quote the $@ here?
    #    echo "/usr/bin/firejail --profile=/etc/firejail/$i.profile" "/usr/bin/.$i \$@" > "/usr/bin/$i"
    #    chmod +x "/usr/bin/$i"
    #    echo "[+] /usr/bin/$i => firejailed"
    #else
    #    echo "[!] /usr/bin/$i => already firejailed"
    #fi
done

create_jail "okular" "--seccomp"
create_jail "quodlibet" "--seccomp"
