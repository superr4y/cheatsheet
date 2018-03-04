#!/bin/sh

dev_addr=dev_04_5D_4B_DE_25_67
pulse=/usr/bin/pulseaudio


disconnect(){
	dbus-send --system --print-reply --dest=org.bluez /org/bluez/hci0/${dev_addr} org.bluez.Device1.Disconnect
}
connect(){
	dbus-send --system --print-reply --dest=org.bluez /org/bluez/hci0/${dev_addr} org.bluez.Device1.Connect
}
pulse_restart(){
	$pulse -k
	$pulse --start
}


disconnect
pulse_restart
sleep 2
connect
