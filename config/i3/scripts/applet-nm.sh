#!/bin/bash
################################################################################
# Name:			applet-nm.sh
# Description:	This script simply launches nm-applet after a short delay.
#				This is needed because I want nm-applet to be always at the 
#				first position from right.			
# Author:		Daniel Pauler
# Version:		1.0
# Last Updated:	12 February 2017
#
################################################################################
# Main Program
#

# Delay (seconds)
sleep 2
# Launch nm-applet
nm-applet &
