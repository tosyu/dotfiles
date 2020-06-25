#!/bin/bash
NITROGEN=$(command -v nitrogen)

if [ "" != "$NITROGEN" ]; then
	$NITROGEN --restore
else
	echo "nitrogen not found"
fi

