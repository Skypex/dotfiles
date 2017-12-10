#!/bin/bash
################################################################################
# Name:         backlight-ctl.sh
# Description:  This script handles the screen brightness.
# Parameters:   $1      '-inc'      Increase brightness
#               $1      '-dec'      Decrease brightness
#               $2      int         Value to inc/dec brightness
# Author:       Daniel Pauler
# Version:      1.0
# Last Updated: 12 February 2017
#
################################################################################
# Set Variables
#

# User that should receive the notification
user='skypex'
# Store directory and file for the Dunst notification replacement
store_dir='/tmp/dunst/'
store='backlight-ctl'
# Device that handles the backlight
backlight_device='/sys/class/backlight/intel_backlight/brightness'

################################################################################
# Main Program
#

# Get current brightness value
current=$(cat "$backlight_device")
new="$current"

# Increase selected
if [[ $1 = "-inc" ]]; then
    # Calculate new brightness value
    new=$(( current + $2 ))

    # Check if new value reached max
    if [[ $new -gt 4437 ]]; then
        new='4437'
    fi
# Decrease selected
elif [[ $1 = "-dec" ]]; then
    # Calculate new brightness value
    new=$(( current - $2 ))

    # Check if new value reached max
    if [[ $new -lt 0 ]]; then
        new='0'
    fi
fi

# Set screen brightness
echo "echo $new > $backlight_device" | bash

# Calculate brightness in %
percent=$((new / (4437 / 100)))

# Prepare notification replacement
mkdir -p $store_dir
chown $user:$user $store_dir
store="$store_dir$store"
touch $store
# Get current notification ID
n_id=$(cat "$store")
# Send notification
if [[ $n_id -gt '0' ]]; then
    sudo -u $user dunstify -p -r $n_id "Brightness: $percent%" -u low > "$store"
else
    sudo -u $user dunstify -p "Brightness: $percent%" -u low > "$store"
fi
