#bg="%{B#161616}"
#fg="%{F#FFFFFF}"
#red="%{B#E84F4F}"
#f_green="%{F#B7CE42}"
#f_red="%{F#E84F4F}"

. "${HOME}/.cache/wal/colors.sh"

bg="%{B$color0}"
fg="%{F$color7}"
red="%{B$color2}"
f_green="%{F$color4}"
f_red="%{F$color2}"

Clock() {
	#DATETIME=$(date "+%T %a %b %d")
	TIME=$(date "+%H:%M")
	echo "$f_green\ue015$fg $TIME"
}

Date() {
	DATE=$(date "+%a %b %d")
	echo "$f_green%{A:~/.bin/calnotif.sh:}\ue225$fg $DATE%{A}"
}


Battery() {
	BATPERC=$(acpi --battery | cut -d, -f2)

#	if [ "$BATPERC" ]
#	then
#		echo -e "WHADUHECKWHADUHECK"
#	fi

	PLUGGED=$(acpi -a | tail -c 8 | grep 'on-line')

	if [ "$PLUGGED" ]
	then
		icon="\ue041"
	else
		icon="\ue040"
	fi

	echo "$f_green$icon$fg $BATPERC"
}


Workspaces() {
	WS=$(~/.bin/ws.sh)
	echo "$WS"
}


Music() {
	if [ "`playerctl status`" ]
	then
		if [ "`playerctl status| grep 'Playing'`" ]
		then
			icon="%{A:playerctl pause:}\ue059%{A}"
		fi


	if [ "`playerctl status| grep 'Paused'`" ]
	then
			icon="%{A:playerctl play:}\ue09a%{A}"
		fi
		echo "$f_green\ue05c$fg %{A:playerctl previous:}\ue096%{A}$icon%{A:playerctl next:}\ue05a%{A} $(playerctl metadata artist) - $(playerctl metadata title)"
	fi
}


Launcher() {
	echo "$red %{A:~/.bin/dmenu.sh:}>>_ $bg%{A}"
}


Volume() {
	vol=$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)
	perc="%"

	if [ "`amixer get Master | grep off`" ]
	then
		icon="\ue052"
	else
		icon="\ue05d"
	fi

	echo "$f_green$icon$fg $vol$perc"
}

Memory() {
	mem=$(free -m | grep -E 'Mem' | awk '{print $3}')
	mb="mB"
	echo "$f_green\ue021$fg $mem$mb"
}

Processor() {
#	freq=$(lscpu | grep "CPU MHz" | awk '{print $3}')
#	hz="MHz"
#	echo "$f_green\ue026$fg $freq$hz"

	usage=$(top -bn1 | grep "Cpu(s)" | cut -b 9-14)
#	usage=$(grep 'cpu ' /proc/stat | awk '{print ($2+$4)*100/($2+$4+$5)}' | cut -c1-4 )
	perc="%"
	echo "$f_green\ue026$fg $usage$perc"

}

Wifi() {
	echo "%{A:~/.bin/dmenu_nm.sh:}$f_green\ue1af$fg $(iwgetid -r)%{A}"
}

Mail() {
	gumail=$(cat ~/.mail/unread-gu)
	chalmail=$(cat ~/.mail/unread-chalmers)
	echo "$f_green\ue1a8$fg $chalmail/$gumail"
}

Power() {
	echo "%{A:~/.bin/dmenu_power.sh:}$red%{O5}\ue10c%{O5}$bg%{A} "
}

while true; do
	buf="$bg"
	buf="$buf%{l}"
	buf="$buf$(Launcher)"
	buf="$buf $(Wifi)"
	buf="$buf $(Volume)"
	buf="$buf $(Music)"
#	buf="$buf $(Mail)"
	buf="$buf %{c}"
	buf="$buf $(Workspaces)"
	buf="$buf %{r}"
#	buf="$buf $(Processor)"
#	buf="$buf $(Memory)"
	buf="$buf $(Battery)"
	buf="$buf $(Date)"
	buf="$buf $(Clock)"
	buf="$buf $(Power)"
	echo -e $buf
	sleep 2
done
