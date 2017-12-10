#!/bin/bash
################################################################################
# Name:         microphone-mute.sh
# Description:  This script to toggle the microphone on and off.
# Author:       Daniel Pauler
# Version:      1.0
# Last Updated: 12 February 2017
#
################################################################################
# Set Variables
#

# Get input device name via "amixer scontrols"
input_device="'Capture'"
# Store directory and file for the Dunst notification replacement
store_dir='/tmp/dunst/'
store='microphone-mute'
# Default state
state='OFF'

################################################################################
# Main Program
#

# Toggle the mic
amixer sset $input_device,0 toggle &> /dev/null

# Get mic state
if amixer sget $input_device,0 | grep '\[on\]' &> /dev/null ; then
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
    dunstify -p -r $n_id "Microphone: $state" -u low > "$store"
else
    dunstify -p "Microphone: $state" -u low > "$store"
fi
