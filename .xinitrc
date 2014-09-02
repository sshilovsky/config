#!/bin/bash
source ~/.profile

setxkbmap -layout us,ru -option -option caps:escape,grp:toggle &

xset dpms 0 0 0 &

~/.autorun &
x-terminal-emulator &
caja --no-default-window &

exec ~/bin/run-wm
