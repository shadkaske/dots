#!/bin/bash
FONT=$1
BG=$2
FG=$3
SBG=$4
SFG=$5
MON=$6

j4-dmenu-desktop --dmenu="dmenu -i -fn '${FONT}' -nb '${BG}' -nf '${FG}' -sb '${SBG}' -sf '${SFG}' -m '${MON}'" --term=x-terminal-emulator
