#!/bin/bash
################################################################################
# Name:			app-scrot.sh
# Description:	This script takes screenshots using scrot.
# Parameters:	$1		'focus'		Take screenshot of active window
#				$1		'full'		Take screenshot of entire screen
# Author:		Daniel Pauler
# Version:		1.0
# Last Updated:	12 February 2017
#
################################################################################
# Set Variables
#

# New screenshots are saved at this path
dir='/home/skypex/Pictures/Screenshots/'

################################################################################
# Main Program
#

# Create the output directory
mkdir -p $dir

# If called with option focus
if [[ $1 = "focus" ]]; then
	# Take the screenshot and move it to /tmp
	scrot -u '%Y%m%d_%H%M%S_Screenshot.png' -e 'mv $f /tmp'
	# Move the new screenshot to the directory
	mv /tmp/*Screenshot.png $dir
	# Send notification
	dunstify 'Screenshot' 'Focused screenshot taken' -u low
# If called with option full
elif [[ $1 = "full" ]]; then
	# Take the screenshot and move it to /tmp
	scrot '%Y%m%d_%H%M%S_Screenshot.png' -e 'mv $f /tmp'
	# Move the new screenshot to the directory
	mv /tmp/*Screenshot.png $dir
	# Send notification
	dunstify 'Screenshot' 'Full screenshot taken' -u low 
fi
