#!/bin/bash
displays="DP1 DP2 DP2-1 DP2-2 DP2-3 HDMI1 HDMI2 VGA1 VIRTUAL1"
for display in $displays; do
  su user -c "export DISPLAY=:0; export XAUTHORITY=/home/user/.Xauthority; xrandr --output $display --off"
done
