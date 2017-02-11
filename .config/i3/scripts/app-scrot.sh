#!/bin/bash

dir="/home/skypex/Pictures/Screenshots/"

mkdir -p $dir

if [ "$1" = "focus" ]
then
	scrot -u '%Y%m%d_%H%M%S_Screenshot.png' -e 'mv $f /tmp'
	mv /tmp/*Screenshot.png $dir
	dunstify "Screenshot" "Focused screenshot taken" -u low 
fi
if [ "$1" = "full" ]
then
	scrot '%Y%m%d_%H%M%S_Screenshot.png' -e 'mv $f /tmp'
	mv /tmp/*Screenshot.png $dir
	dunstify "Screenshot" "Full screenshot taken" -u low 
fi