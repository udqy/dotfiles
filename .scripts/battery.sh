#!/bin/bash

init_status=$(cat /sys/class/power_supply/BAT0/status)
init_bat_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
notify-send --urgency=NORMAL "󱟢 Battery ${init_bat_lvl} %" "  Status: ${init_status}"

while true; do
    CSTATUS=$(cat /sys/class/power_supply/BAT0/status)
    BAT_LVL=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ "$CSTATUS" = "Discharging" ]; then
        if [ "$BAT_LVL" -le 15 ] ; then
            notify-send --urgency=CRITICAL "󰂎 Battery Low" "  Level: ${BAT_LVL}%"
            mpv ~/.notif/nothing.mp3
            sleep 30
        else
            sleep 30
        fi
	fi
    if [ "$BAT_LVL" -gt 94 ] ; then
        notify-send --urgency=NORMAL "󰂄 Battery Full" "  Level: ${BAT_LVL}%"
        mpv ~/.notif/nothing.mp3
		sleep 1000
    fi
	sleep 30
done
