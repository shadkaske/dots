#!/bin/bash
FONT=$1
BG=$2
FG=$3
SBG=$4
SFG=$5

j4-dmenu-desktop --dmenu="dmenu -i -fn '${FONT}' -nb '${BG}' -nf '${FG}' -sb '${SBG}' -sf '${SFG}'" --term=x-terminal-emulator
