#!/bin/bash
################################################################################
# Name:			touchpad-ctl.sh
# Description:	This script to toggle the touchpad on and off.
# Author:		Daniel Pauler
# Version:		1.0
# Last Updated:	12 February 2017
#
################################################################################
# Set Variables
#

# Store directory and file for the Dunst notification replacement
store_dir='/tmp/dunst/'
store='touchpad-ctl'
# Default state
state='OFF'

################################################################################
# Main Program
#

if synclient -l | grep "TouchpadOff .*=.*0" &> /dev/null ; then
	synclient TouchpadOff=1 ;
else
	synclient TouchpadOff=0 ;
	state='ON'
fi

# Prepare notification replacement
mkdir -p $store_dir
store="$store_dir$store"
touch $store
# Get current notification ID
n_id=$(cat "$store")
# Send notification
if [[ $n_id -gt '0' ]]; then
	dunstify -p -r $n_id "Touchpad: $state" -u low > "$store"
else
	dunstify -p "Touchpad: $state" -u low > "$store"
fi
