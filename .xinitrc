#!/bin/bash
source ~/.profile

xrdb -override ~/.Xresources

setxkbmap -layout us,ru -option -option caps:escape,grp:toggle,grp:alt_shift_toggle &

xset dpms 0 0 0 &

~/.autorun &
~/.autorun-local &

exec ~/bin/run-wm
