#!/bin/bash
# reset crtc... VGA1 keeps CRTC 2 after disconect and the third display can't get CRTC 2 then
#su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr -s 0"
#sleep 3
#su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr --output eDP-1 --mode 1920x1080 --primary"
xrandr --output eDP-1 --off
xrandr --output DP-1-8 --crtc 0 --auto --primary
xrandr --output DP-1-1 --crtc 1 --auto --left-of DP-1-8
xrandr --output VGA-1 --auto --left-of DP-1-1  
#xrandr --output DP1-1 --off
#su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr --output VGA-1 --mode 1280x1024 --left-of DP-2-2"
