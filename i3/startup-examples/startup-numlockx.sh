#!/bin/bash
NUMLOCKX=$(command -v numlockx)

if [ "" != "$NUMLOCKX" ]; then
	$NUMLOCKX on
else
	echo "numlockx not found"
fi

