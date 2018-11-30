xset +fp /usr/share/fonts/local/
xset fp rehash
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
i3
