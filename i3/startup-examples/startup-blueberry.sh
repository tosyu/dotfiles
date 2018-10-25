#!/bin/bash
BLUEBERRY=$(command -v blueberry)

if [ "" != "$BLUEBERRY" ]; then
	$BLUEBERRY &
else
	echo "blueberry not found"
fi

