#!/bin/bash

menu="$1"

if [ "$menu" = "drun" ]; then
    rofi -show drun -theme material
elif [ "$menu" = "window" ]; then
    rofi -show window -theme material
elif [ "$menu" = "powermenu" ]; then
    rofi -modi "Powermenu:~/scripts/rofi/rofi-powermenu.sh" -show Powermenu -theme material
fi
