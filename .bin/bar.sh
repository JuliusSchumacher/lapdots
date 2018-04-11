bg="%{B#FF1D1F21}"
blue="%{B#81A2BE}"
red="%{B#A54242}"


fg="%{F#FFFFFF}"
f_magenta="%{F#b294bb}"
f_green="%{F#8c9440}"
f_lgreen="%{F#b5bd68}"
f_red="%{F#A54242}"
f_yellow="%{F#de935f}"
f_blue="%{F#5f819d}"
f_cyan="%{F#5e8d87}"


Clock() {
	DATETIME=$(date "+%T %a %b %d")
	TIME=$(date "+%T")
	echo "$f_green\ue015$fg $TIME"
}

Date() {
	DATE=$(date "+%a %b %d")
	echo "$f_green\ue225$fg $DATE"
}


Battery() {
	BATPERC=$(acpi --battery | cut -d, -f2)

#	if [ "$BATPERC" ]
#	then
#		echo -e "WHADUHECKWHADUHECK"
#	fi


	echo "$f_green\ue040$fg $BATPERC"
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

	if [ "`ncmpcpp --current | grep '('`" ]
	then
		echo "$f_green\ue05c$fg $(ncmpcpp --current %a) - $(ncmpcpp --current %t)"
	fi
}


Launcher() {
	echo "$red %{A:~/.bin/dmenu.sh:}>>_ $bg%{A}"
}


Volume() {
	vol=$(amixer get Master | sed -n 's/^.*\[\([0-9]\+\)%.*$/\1/p'| uniq)
	perc="%"
	echo "$f_green\ue05d$fg $vol$perc"
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

	usage=$(grep 'cpu ' /proc/stat | awk '{print ($2+$4)*100/($2+$4+$5)}' | cut -c1-4 )
	perc="%"
	echo "$f_green\ue026$fg $usage$perc"

}

Wifi() {
	echo "%{A:~/.bin/dmenu_nm.sh:}$f_green\ue1af$fg $(iwgetid -r)%{A}"
}


while true; do
	buf="$bg"
	buf="$buf%{l}"
	buf="$buf$(Launcher)"
	buf="$buf $(Wifi)"
	buf="$buf $(Volume)"
	buf="$buf $(Music)"
	buf="$buf %{c}"
	buf="$buf $(Workspaces)"
	buf="$buf %{r}"
	buf="$buf $(Processor)"
	buf="$buf $(Memory)"
	buf="$buf $(Battery)"
	buf="$buf $(Date)"
	buf="$buf $(Clock) %{O10}"
	echo -e $buf
	sleep 0.01
done
