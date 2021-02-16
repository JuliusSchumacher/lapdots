#!/bin/sh


# fetch colors from wal
. "${HOME}/.cache/wal/colors.sh"

case "$(echo -e "Shutdown\nRestart\nLogout\nLock" | dmenu \
	-x 3280 \
	-y 17 \
	-h 20 \
	-w 70 \
	-fn "Hack 14" \
	-sb $color2 \
	-nb $color0 \
	-l 4 -i \
	)" in
		Shutdown) exec systemctl poweroff;;
		Restart) exec systemctl reboot;;
		Logout) exec i3-msg exit;;
		Lock) exec ~/.bin/worselock;;
esac
