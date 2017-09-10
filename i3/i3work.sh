#!/bin/bash
# reset crtc... VGA1 keeps CRTC 2 after disconect and the third display can't get CRTC 2 then
#su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr -s 0"
#sleep 3
#su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr --output eDP-1 --mode 1920x1080 --primary"
xrandr --output eDP-1 --off


# w2
#xrandr --output DP-1-8 --crtc 0 --auto --primary
#xrandr --output DP-1-1 --crtc 1 --auto --left-of DP-1-8



# w3
#VGA-1 connected (normal left inverted right x axis y axis)
#   1920x1080     60.00 +
#   1280x1024     75.02    60.02  
#   1152x864      75.00  
#   1024x768      75.03    60.00  
#   800x600       75.00    60.32  
#   640x480       75.00    59.94  
#   720x400       70.08  
#DP-1 connected (normal left inverted right x axis y axis)
#   2560x1440     59.95 +
#   2048x1152     60.00  
#   1920x1200     59.88  
#xrandr --output DP-1 --crtc 0 --mode 1920x1200 --primary
xrandr --output DP-1 --crtc 0 --auto --primary
xrandr --output VGA-1 --crtc 1 --auto --right-of DP-1



# shk room
#xrandr --output DP-1-8 --crtc 0 --auto --primary
#xrandr --output DP-1-1 --crtc 1 --auto --right-of DP-1-8


#xrandr --output VGA-1 --auto --left-of DP-1-1  
#xrandr --output DP1-1 --off
#su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr --output VGA-1 --mode 1280x1024 --left-of DP-2-2"
