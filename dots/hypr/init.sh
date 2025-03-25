#!/usr/bin/env bash

pkill waybar
pkill polkit-gnome-au
pkill swww-daemon
pkill swaync

waybar &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
swww-daemon &
swaync &
mpv ~/.config/samrya.wav