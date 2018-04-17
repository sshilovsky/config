#!/bin/bash

LEFT="$1"
LEFTMODE="$2"
RIGHT="$3"
RIGHTMODE="$4"
mode=2

function switch()
{
    case $mode in
        0)
            mode=1
            xrandr --output $RIGHT --mode $RIGHTMODE --size $RIGHTMODE
            xrandr --output $LEFT --off
            ;;
        1)
            mode=2
            xrandr --output $LEFT --mode $LEFTMODE --size $LEFTMODE
            xrandr --output $RIGHT --off
            ;;
        *)
            mode=0
            xrandr --output $LEFT --mode $LEFTMODE --size $LEFTMODE
            xrandr --output $RIGHT --mode $RIGHTMODE --size $RIGHTMODE
            xrandr --auto --output $RIGHT --right-of $LEFT
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
