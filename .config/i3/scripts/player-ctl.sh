#!/bin/bash

store_dir="/tmp/dunst/"
store="player-ctl"
state="No player active"


h=$(playerctl status)
if [ ! $h = "No player found" ]
then
	if [ "$1" = "play" ]
	then
		playerctl play-pause
		h=$(playerctl status)
		if [ $h = "Playing" ]
		then
			state=Play
		else
			state=Pause
		fi
	fi
	if [ "$1" = "next" ]
	then
		playerctl next
		state="Next"
	fi
	if [ "$1" = "prev" ]
	then
		playerctl previous
		state="Previous"
	fi
fi

# Sent notifications
mkdir -p $store_dir
store=$store_dir$store
touch $store
id=$(cat "$store")
if [ $id -gt "0" ]
then
	dunstify -p -r $id "Player: $state" -u low > "$store"
else
	dunstify -p "Player: $state" -u low > "$store"
fi