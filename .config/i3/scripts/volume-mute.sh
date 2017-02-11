#!/bin/bash

store_dir="/tmp/dunst/"
store="volume-ctl"

pactl set-sink-mute 0 toggle


volume=$(/usr/share/i3blocks/volume)


# Sent notifications
mkdir -p $store_dir
store=$store_dir$store
touch $store
id=$(cat "$store")
if [ $id -gt "0" ]
then
	dunstify -p -r $id "Volume: $volume" -u low > "$store"
else
	dunstify -p "Volume: $volume" -u low > "$store"
fi