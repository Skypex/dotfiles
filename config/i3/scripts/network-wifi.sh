#!/bin/bash
################################################################################
# Name:         network-wifi.sh
# Description:  This script to toggle the wifi on and off.
#               The actual on/off magic is done by the driver itself.
# Author:       Daniel Pauler
# Version:      1.1
# Last Updated: 23 December 2017
#
################################################################################
# Set Variables
#

# User that should receive the notification
user='skypex'
# Store directory and file for the Dunst notification replacement
store_dir='/tmp/dunst/'
store='network-wifi'
# Default state
state='OFF'

################################################################################
# Main Program
#

# Get wifi state
wifi=$(sudo -u $user rfkill list 1 | grep -i 'soft blocked' | cut -d' ' -f3)
if [[ $wifi == "no" ]]; then
    state="ON"
fi

# Prepare notification replacement
mkdir -p $store_dir
store="$store_dir$store"
touch $store
# Get current notification ID
n_id=$(cat "$store")
# Send notification
if [[ $n_id -gt '0' ]]; then
    dunstify -p -r $n_id "Wifi: $state" -u low > "$store"
else
    dunstify -p "Wifi: $state" -u low > "$store"
fi
