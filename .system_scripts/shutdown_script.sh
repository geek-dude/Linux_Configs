#!/bin/dash
pactl set-sink-volume "alsa_output.pci-0000_00_1f.3.analog-stereo" 0%
pactl set-sink-mute "alsa_output.pci-0000_00_1f.3.analog-stereo" 1
sleep 0.5s
systemctl poweroff
