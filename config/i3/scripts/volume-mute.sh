#!/bin/bash
################################################################################
# Name:			volume-mute.sh
# Description:	This script to toggle the volume on and off.
# Author:		Daniel Pauler
# Version:		1.0
# Last Updated:	12 February 2017
#
################################################################################
# Set Variables
#

# Store directory and file for the Dunst notification replacement
store_dir='/tmp/dunst/'
store='volume-ctl'

################################################################################
# Main Program
#

# Toggle volume mute
pactl set-sink-mute 0 toggle

# Get current volume level using i3blocks helper script
volume=$(/usr/share/i3blocks/volume)

# Prepare notification replacement
mkdir -p $store_dir
store="$store_dir$store"
touch $store
# Get current notification ID
n_id=$(cat "$store")
# Send notification
if [[ $n_id -gt '0' ]]; then
	dunstify -p -r $n_id "Volume: $volume" -u low > "$store"
else
	dunstify -p "Volume: $volume" -u low > "$store"
fi
