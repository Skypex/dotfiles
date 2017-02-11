#!/bin/bash

store_dir="/tmp/dunst/"
store="volume-ctl"


if [ "$1" = "-inc" ]
then
	pactl set-sink-volume 0 +$2%
fi
if [ "$1" = "-dec" ]
then
	pactl set-sink-volume 0 -$2%
fi


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