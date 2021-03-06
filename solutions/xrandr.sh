#!/bin/bash

vga="$(xrandr -q | egrep '^VGA1' | awk '{print $2;}')"
lvds="$(xrandr -q | egrep '^LVDS1' | awk '{print $2;}')"

if [ "$lvds" = "connected" ]
then
    if [ "$vga" = "connected" ]
    then
        xrandr --auto --output VGA1 --left-of LVDS1
        xrandr --output VGA1 --mode 1280x1024 -s 1280x1024
        xrandr --output LVDS1 --mode 1024x600 -s 1024x600
    else
        xrandr --output VGA1 --off
        xrandr --output LVDS1 --auto
        xrandr --output LVDS1 --mode 1024x600 -s 1024x600
    fi
fi
