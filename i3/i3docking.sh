#!/bin/bash
# reset crtc... VGA1 keeps CRTC 2 after disconect and the third display can't get CRTC 2 then
#su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr -s 0"
#sleep 3
#xrandr --output eDP-1 --mode 1920x1080 --primary
xrandr --output eDP-1 --off
xrandr --output DP-2-1 --mode 1920x1080 --crtc 0 --primary
xrandr --output DP-2-2 --mode 1920x1080 --crtc 1 --left-of DP-2-1 
#xrandr --output DP-2-3 --mode 1280x1024 --left-of DP-2-2
#su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr --output VGA1 --mode 1280x1024 --left-of DP2-2"
