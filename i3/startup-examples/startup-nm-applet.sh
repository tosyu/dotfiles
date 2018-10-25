#!/bin/bash
NMAPPLET=$(command -v nm-applet)

if [ "" != "$NMAPPLET" ]; then
	$NMAPPLET &
else
	echo "nm-applet not found"
fi

