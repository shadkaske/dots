#!/bin/bash

NUM_DISPLAYS=$(xrandr | ag " connected " | wc -l)

compton &
nitrogen --restore &
dropbox start &
/usr/bin/autokey &
greenclip daemon &
unclutter -idle 5 &
sxhkd &

case $NUM_DISPLAYS in
    "3")
        sh $HOME/.screenlayout/deskscreen.sh ;;
esac

dwmbar &
