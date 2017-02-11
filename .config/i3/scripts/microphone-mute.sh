#!/bin/bash

store_dir="/tmp/dunst/"
store="microphone-mute"
# Get input device name via "amixer scontrols"
input_device="'Capture'"
state="OFF"


if amixer sget $input_device,0 | grep '\[on\]' ; then
    amixer sset $input_device,0 toggle
else
    amixer sset $input_device,0 toggle
    state="ON"          
fi


# Sent notifications
mkdir -p $store_dir
store=$store_dir$store
touch $store
id=$(cat "$store")
if [ $id -gt "0" ]
then
	dunstify -p -r $id "Microphone: $state" -u low > "$store"
else
	dunstify -p "Microphone: $state" -u low > "$store"
fi