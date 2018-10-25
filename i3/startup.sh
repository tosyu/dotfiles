#!/bin/sh
cd ~

echo "Processing startup scripts"
for script in $(ls -d ~/.config/i3/startup/*); do
	SCR=$(readlink -f -- $script)
	echo "Checking for $SCR"
	if [ -x "$SCR" ]; then
		echo "Running $script"
		nohup $SCR </dev/null >/dev/null 2>&1 &
	else
		echo "Not found: $SCR"
	fi
done

