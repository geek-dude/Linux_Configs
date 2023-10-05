#!/bin/dash
pactl set-sink-mute $(pactl get-default-sink) toggle
