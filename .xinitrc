xset +fp /usr/share/fonts/local/
xset fp rehash
xset r rate 250 60 &
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
i3
# awesome
# howm
# budgie-desktop
# sowm
