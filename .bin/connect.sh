#! /bin/bash

sudo ip link set wlp2s0 up
sudo iw dev wlp2s0 connect ShadowNet
sudo dhcpcd
