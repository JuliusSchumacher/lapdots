#! /bin/zsh

notify-send Calendar "$(gcalcli --nocolor agenda today tomorrow)"
