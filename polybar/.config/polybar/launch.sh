#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get the DESKTOP_SESSION name
desktop=$(echo $DESKTOP_SESSION)

primary_mon=$(xrandr --query | grep " primary" | cut -d" " -f1)

case $desktop in

    bspwm|/usr/share/xsessions/bspwm)
        if type "xrandr" > /dev/null; then
            for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
                MONITOR=$m polybar --reload bspwm &
            done
        else
            polybar --reload bspwm &
        fi
        ;;

    spectrwm|/usr/share/xsessions/spectrwm)
        if type "xrandr" > /dev/null; then
            for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
                if [[ $primary_mon == $m ]]; then
                    MONITOR=$m polybar --reload spectrwm-primary &
                else
                    MONITOR=$m polybar --reload spectrwm-secondary &
                fi
            done
        else
            polybar --reload spectrwm &
        fi
        ;;
esac
