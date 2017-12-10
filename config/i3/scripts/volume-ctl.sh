#!/bin/bash
################################################################################
# Name:         volume-ctl.sh
# Description:  This script handles the volume.
# Parameters:   $1      '-inc'      Increase volume
#               $1      '-dec'      Decrease volume
#               $2      int         Value to inc/dec volume
# Author:       Daniel Pauler
# Version:      1.0
# Last Updated: 12 February 2017
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

# Get current volume level using i3blocks helper script
volume=$(/usr/share/i3blocks/volume)

# Check if increase or decrease volume
value=$2
if [[ $1 = "-inc" ]]; then
    # Check if value goes over maximum
    if [[ ${volume:0: -1} -ge '100' ]]; then
        value=0
    fi
    # Increase volume
    pactl set-sink-volume 0 +$value%
elif [[ $1 = "-dec" ]]; then
    # Decrease volume
    pactl set-sink-volume 0 -$value%
fi

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
