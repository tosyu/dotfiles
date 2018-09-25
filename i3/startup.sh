#!/bin/sh
cd ~

startup=""
startup="$startup .screenlayout/startup.sh"
startup="$startup .config/polybar/startup.sh"
startup="$startup .config/i3/startup-nitrogen.sh"
startup="$startup .config/i3/startup-numlockx.sh"
startup="$startup .config/i3/startup-unclutter.sh"
startup="$startup .config/i3/startup-compton.sh"

echo "Processing startup scripts"
for script in ${startup}; do
	SCR=$(readlink -f -- $script)
	echo "Checking for $SCR"
	if [ -x "$SCR" ]; then
		echo "Running $script"
		nohup $SCR </dev/null >/dev/null 2>&1 &
	else
		echo "Not found: $SCR"
	fi
done

