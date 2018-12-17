xset +fp /usr/share/fonts/local/
xset fp rehash
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
xinput disable 12
xinput disable 11
i3
