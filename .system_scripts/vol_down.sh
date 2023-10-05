#!/bin/dash
pactl set-sink-volume $(pactl get-default-sink) -5%
