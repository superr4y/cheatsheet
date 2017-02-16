#!/bin/sh

if [ "$1" = "enp0s25" ]; then
	if [ "$2" = "down" ]; then
		#echo "dooooowwnwwnwnw" >> /tmp/loggg
		umount /home/user/shk01
		umount /home/user/shk02
	fi
fi
