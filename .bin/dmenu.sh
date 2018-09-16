#! /bin/zsh

# fetch colors from wal
. "${HOME}/.cache/wal/colors.sh"

export PATH=$PATH:$HOME/.bin
dmenu_run -w 400 -h 10 -x 0 -y 0 -p ">>_" -fn "-misc-tamsyn-medium-r-normal-*-12-*-*-*-*-iso8859-1" -sb $color2 -nb $color0 -s 1
