#!/bin/bash

store_dir="/tmp/dunst/"
store="backlight-ctl"
user="skypex"

file="/sys/class/backlight/intel_backlight/brightness"
current=$(cat "$file")
new="$current"
if [ "$1" = "-inc" ]
then
    new=$(( current + $2 ))
    if [ "$new" -gt 4437 ]
    then
	new="4437"
    fi
fi
if [ "$1" = "-dec" ]
then
    new=$(( current - $2 ))
    if [ "$new" -lt 0 ]
    then
	new="0"
    fi
fi
echo "echo $new > $file" | bash


# Calculate brightness
percent=$((new / (4437 / 100)))


# Sent notifications
mkdir -p $store_dir
chown $user:$user $store_dir
store=$store_dir$store
touch $store
id=$(cat "$store")
if [ $id -gt "0" ]
then
	dunstify -p -r $id "Brightness: $percent%" -u low > "$store"
else
	dunstify -p "Brightness: $percent%" -u low > "$store"
fi