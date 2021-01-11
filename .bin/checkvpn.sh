#!/bin/bash

flag=$(wget -qO- https://am.i.mullvad.net/connected | grep not)

if [ "$flag" ]; then
	notify-send -u critical VPN "Not connected!"
else
    notify-send -u critical VPN "Connected!"
fi
