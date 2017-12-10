#!/bin/bash
################################################################################
# Name:         app-i3lock.sh
# Description:  This script implements a lockscreen using i3lock. It takes a 
#               screenshot and blurs it. Afterwards this screenshot is used as 
#               lockscreen background.
# Author:       Daniel Pauler
# Version:      1.0
# Last Updated: 12 February 2017
#
################################################################################
# Main Program
#

# Take screenshot
scrot /tmp/lockscreen.png
# Add blur effect
convert /tmp/lockscreen.png -blur 0x5 /tmp/lockscreen.png
# Lock the screen
i3lock -i /tmp/lockscreen.png
