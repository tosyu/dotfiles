#!/bin/bash
UNCLUTTER=$(command -v unclutter)

if [ "" != "$UNCLUTTER" ]; then
	$UNCLUTTER &
else
	echo "unclutter not found"
fi

