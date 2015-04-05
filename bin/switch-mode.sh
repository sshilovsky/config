#!/bin/bash

SQUARE="VGA-0"
WIDE="DVI-I-1"
mode=2

function switch()
{
    case $mode in
        0)
            mode=1
            xrandr --output $SQUARE --mode 1280x1024 --size 1280x1024
            xrandr --output $WIDE --off
            ;;
        1)
            mode=2
            xrandr --output $WIDE --mode 1920x1080 --size 1920x1080
            xrandr --output $SQUARE --off
            ;;
        *)
            mode=0
            xrandr --output $SQUARE --mode 1280x1024 --size 1280x1024
            xrandr --output $WIDE --mode 1920x1080 --size 1920x1080
            xrandr --auto --output $WIDE --right-of $SQUARE
            ;;
    esac
}

switch
trap "switch" SIGUSR1

while true
do
    sleep 1s
    wait
done
