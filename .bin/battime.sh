#! /bin/zsh
acpi | sed 's/(//' | awk '{print $5}'
