#! /bin/zsh

# fetch colors from wal
. "${HOME}/.cache/wal/colors.sh"

export PATH=$PATH:$HOME/.bin
dmenu_run -w 400 -h 17 -x 0 -y 0 -p ">>_" -fn "-nerdypepper-scientifica-medium-r-normal--11-80-100-100-c-50-iso10646-1" -sb $color2 -nb $color0 -s 1
