#!/bin/bash
COMPTON=$(command -v compton)

if [ "" != "$COMPTON" ]; then
	$COMPTON -b --backend glx --vsync opengl
else
	echo "compton not found"
fi

