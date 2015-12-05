#!/bin/bash

echo "create exclude list"

cat >> stage4.excl << EOF
.bash_history
/mnt/*
/tmp/*
/proc/*
/sys/*
/dev/*
/etc/ssh/ssh_host_*
/usr/portage/*
/var/lib/docker/*
/var/lib/libvirt/*
/home/user/*
"$PWD"/stage4.tar.gz
EOF

tar -czvf stage4.tar.gz / -X stage4.excl
echo "stage4.tar.gz is ready"
