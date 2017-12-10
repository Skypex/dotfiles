#!/bin/bash
################################################################################
# Name:         player-ctl.sh
# Description:  This script implements media buttons using playerctl.
# Parameters:   $1      'play'      Toggle play/pause
#               $1      'prev'      Play previous song
#               $1      'next'      Play next song
# Author:       Daniel Pauler
# Version:      1.0
# Last Updated: 12 February 2017
#
################################################################################
# Set Variables
#

# Store directory and file for the Dunst notification replacement
store_dir='/tmp/dunst/'
store='player-ctl'
# Default state
state='No player active'

################################################################################
# Main Program
#

# Get current player status
current=$(playerctl status)
# If status not "No player found"
if [[ $current ]]; then
    # Action "play"
    if [[ $1 = "play" ]]; then
        # Toggle play/pause
        playerctl play-pause
        # Get new current status
        current=$(playerctl status)
        if [[ $current = "Playing" ]]; then
            state='Play'
        else
            state='Pause'
        fi
    # Action "next"
    elif [[ $1 = "next" ]]; then
        playerctl next
        state='Next'
    # Action "prev"
    elif [[ $1 = "prev" ]]; then
        playerctl previous
        state='Previous'
    fi
fi

# Prepare notification replacement
mkdir -p $store_dir
store="$store_dir$store"
touch $store
# Get current notification ID
n_id=$(cat "$store")
# Send notification
if [[ $n_id -gt '0' ]]; then
    dunstify -p -r $n_id "Player: $state" -u low > "$store"
else
    dunstify -p "Player: $state" -u low > "$store"
fi
