#! /bin/zsh

. "$HOME/.cache/wal/colors.sh"

bg="$color0"
fg="$color7"
low="$color9"
high="$color4"

dunst -lf "$fg" -nf "$fg" -cf "$fg" -lb "$bg" -nb "$bg" -cb "$bg" -lfr "$low" -nfr "$fg" -cfr "$high"

