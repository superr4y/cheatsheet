#!/bin/bash
echo "Fixing acpi settings."
for usb in `cat /proc/acpi/wakeup |  cut -f1`;
do
        state=`cat /proc/acpi/wakeup | grep $usb | cut -f3 | cut -d' ' -f1 | tr -d '*'`
        echo "device = $usb, state = $state"
        if [ "$state" == "enabled" ] && [ "$usb" != "LID" ]
        then
                echo $usb > /proc/acpi/wakeup
                #echo "#####" $usb 
        fi
done
chmod o+w /sys/class/backlight/intel_backlight/brightness
