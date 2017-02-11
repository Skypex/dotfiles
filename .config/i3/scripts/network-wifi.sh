#!/bin/bash

store_dir="/tmp/dunst/"
store="network-wifi"
state="Disabled"

sleep 1

h=$(nmcli radio wifi)
if [ $h = "enabled" ]
then
	state="Enabled"
fi


# Sent notifications
mkdir -p $store_dir
store=$store_dir$store
touch $store
id=$(cat "$store")
if [ $id -gt "0" ]
then
	dunstify -p -r $id "Wifi: $state" -u low > "$store"
else
	dunstify -p "Wifi: $state" -u low > "$store"
fi