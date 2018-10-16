#! /bin/zsh

currentdesk=$(wmctrl -d | grep '*' | awk '{print $9}')
currentdesk=$(($currentdesk - 1))

currentwindows=$(wmctrl -l | awk '{print $2}' | grep $currentdesk)

if [ "$currentwindows" = "" ]; then
	notify-send "nothing!"
else
	notify-send "$currentwindows"
fi
