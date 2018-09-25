#!/bin/sh
cd ~
WALLPAPER=
LINKPATH=".i3lock.png"
COLOR="101010"

if [ -e "$LINKPATH" ]; then
	WALLPAPER=$(readlink -f $LINKPATH)
fi

if [ "" != "$WALLPAPER" ]; then
	i3lock -t -i $WALLPAPER
else
	i3lock -c $COLOR
fi

