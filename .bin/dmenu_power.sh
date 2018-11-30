#!/bin/sh


# fetch colors from wal
. "${HOME}/.cache/wal/colors.sh"

case "$(echo -e "Shutdown\nRestart\nLogout\nLock" | dmenu \
	-x 1870 \
	-y 12 \
	-h 12 \
	-w 50 \
	-fn "-nerdypepper-scientifica-medium-r-normal--11-80-100-100-c-50-iso10646-1" \
	-sb $color2 \
	-nb $color0 \
	-l 4 \
	)" in
		Shutdown) exec systemctl poweroff;;
		Restart) exec systemctl reboot;;
		Logout) exec i3-msg exit;;
		Lock) exec ~/.bin/worselock;;
esac
