#!/bin/bash
################################################################################
# Name:			setup.sh
# Description:	This script can handle symlink creation for dotfiles.
# Author:		Daniel Pauler
# Version:		1.0
# Last Updated:	13 February 2017
#
################################################################################
# Set Variables
#
# Note: 		All variables will get the ~/ prefix

# Folder of the dotfiles repository
dotfiles='Code/dotfiles'
# Folder where the backup files should go
dotfiles_backup='dotfiles_backup'
# List of files/folders to symlink (without the dot prefix)
files='zshrc Xresources config/i3 config/rofi'

################################################################################
# Main Program
#

echo 'Script started!'
echo ' '

# Create the backup folder
mkdir -p ~/$dotfiles_backup

# Move old file and then create symlink
for file in $files; do
	echo "Processing $dotfiles/$file"
	# Create backup
	mv ~/.$file ~/$dotfiles_backup
	# Create symlink
	ln -s ~/$dotfiles/$file ~/.$file
done

echo ' '
echo 'Script ended!'
