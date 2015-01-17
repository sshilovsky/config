#!/bin/sh

function switch()
{
    case $mode in
        0)
            mode=1
            xrandr --output VGA1 --mode 1280x1024 --size 1280x1024
            xrandr --output HDMI1 --off
            ;;
        1)
            mode=2
            xrandr --output HDMI1 --mode 1920x1080 --size 1920x1080
            xrandr --output VGA1 --off
            ;;
        *)
            mode=0
            xrandr --output VGA1 --mode 1280x1024 --size 1280x1024
            xrandr --output HDMI1 --mode 1920x1080 --size 1920x1080
            xrandr --auto --output HDMI1 --right-of VGA1
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
