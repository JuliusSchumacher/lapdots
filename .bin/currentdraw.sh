#! /bin/zsh

while true; do
	echo | cat /sys/class/power_supply/BAT0/power_now
	sleep 0.5
done
